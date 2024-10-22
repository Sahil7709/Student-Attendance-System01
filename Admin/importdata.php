<?php
// importData.php

// Start session
session_start();

// Load the database configuration file
require_once 'dbConfig.php';

// Initialize response variables
$res_status = $res_msg = '';

// Check if the form was submitted
if (isset($_POST['importSubmit'])) {
    // Allowed MIME types for CSV files
    $csvMimes = array(
        'text/csv',
        'text/plain',
        'application/csv',
        'application/vnd.ms-excel',
        'application/octet-stream',
        'text/comma-separated-values',
        'text/x-comma-separated-values',
        'text/x-csv',
        'application/x-csv',
        'application/x-comma-separated-values',
        'text/tab-separated-values'
    );

    // Validate if a file was uploaded and its MIME type
    if (!empty($_FILES['file']['name']) && in_array($_FILES['file']['type'], $csvMimes)) {
        // Check if the file was uploaded without errors
        if (is_uploaded_file($_FILES['file']['tmp_name'])) {
            // Open the uploaded CSV file in read-only mode
            if (($csvFile = fopen($_FILES['file']['tmp_name'], 'r')) !== FALSE) {
                // Optional: Set the maximum execution time to prevent timeout for large files
                set_time_limit(300); // 5 minutes

                // Skip the first line if it contains headers
                $header = fgetcsv($csvFile);
                // Optional: Validate headers here

                // Prepare SQL statements using prepared statements for security
                $insertStmt = $db->prepare("INSERT INTO members (name, email, phone, created, modified, status) VALUES (?, ?, ?, NOW(), NOW(), ?)");
                $updateStmt = $db->prepare("UPDATE members SET name = ?, phone = ?, status = ?, modified = NOW() WHERE email = ?");
                $checkStmt = $db->prepare("SELECT id FROM members WHERE email = ?");

                if (!$insertStmt || !$updateStmt || !$checkStmt) {
                    // Handle statement preparation errors
                    $res_status = 'danger';
                    $res_msg = 'Database statement preparation failed: ' . $db->error;
                } else {
                    // Begin transaction
                    $db->begin_transaction();

                    try {
                        // Iterate through each row of the CSV
                        while (($row = fgetcsv($csvFile)) !== FALSE) {
                            // Trim and sanitize each field
                            $name = isset($row[0]) ? trim($row[0]) : '';
                            $email = isset($row[1]) ? trim($row[1]) : '';
                            $phone = isset($row[2]) ? trim($row[2]) : '';
                            $status = isset($row[3]) ? trim($row[3]) : '';

                            // Basic validation
                            if (empty($name) || empty($email) || empty($phone) || ($status !== '1' && $status !== '0')) {
                                // Skip invalid rows or handle as needed
                                continue;
                            }

                            // Check if the email already exists
                            $checkStmt->bind_param('s', $email);
                            $checkStmt->execute();
                            $checkStmt->store_result();

                            if ($checkStmt->num_rows > 0) {
                                // Email exists, perform an update
                                $updateStmt->bind_param('siss', $name, $phone, $status, $email);
                                $updateStmt->execute();
                            } else {
                                // Email does not exist, perform an insert
                                $insertStmt->bind_param('sssi', $name, $email, $phone, $status);
                                $insertStmt->execute();
                            }
                        }

                        // Commit the transaction
                        $db->commit();

                        $res_status = 'success';
                        $res_msg = 'Members data has been imported successfully.';
                    } catch (Exception $e) {
                        // Rollback the transaction on error
                        $db->rollback();

                        $res_status = 'danger';
                        $res_msg = 'Error importing data: ' . $e->getMessage();
                    }

                    // Close statements
                    $insertStmt->close();
                    $updateStmt->close();
                    $checkStmt->close();
                }

                // Close the CSV file
                fclose($csvFile);
            } else {
                $res_status = 'danger';
                $res_msg = 'Failed to open the uploaded CSV file.';
            }
        } else {
            $res_status = 'danger';
            $res_msg = 'File upload error. Please try again.';
        }
    } else {
        $res_status = 'danger';
        $res_msg = 'Please upload a valid CSV file.';
    }

    // Store status in SESSION
    $_SESSION['response'] = array(
        'status' => $res_status,
        'msg' => $res_msg
    );

    // Redirect back to the main page
    header("Location: index.php");
    exit();
} else {
    // If the form wasn't submitted, redirect to the main page
    header("Location: index.php");
    exit();
}
?>