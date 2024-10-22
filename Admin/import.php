
<?php 
include '../Includes/dbcon.php';
include '../Includes/session.php';

if(isset($_POST['upload'])){
    // Check if file is uploaded
    if(is_uploaded_file($_FILES['csv_file']['tmp_name'])){
        // Open uploaded CSV file with read-only mode
        $csv_file = fopen($_FILES['csv_file']['tmp_name'], 'r');
        
        // Skip the first line as it contains the column headers
        fgetcsv($csv_file);

        // Read file line by line
        while(($row = fgetcsv($csv_file)) !== FALSE){
            // Get row data
            $id = mysqli_real_escape_string($conn, $row[0]);
            $firstName = mysqli_real_escape_string($conn, $row[1]);
            $lastName = mysqli_real_escape_string($conn, $row[2]);
            $otherName = mysqli_real_escape_string($conn, $row[3]);
            $admissionNumber = mysqli_real_escape_string($conn, $row[4]);
            $password = mysqli_real_escape_string($conn, $row[5]);
            $classId = mysqli_real_escape_string($conn, $row[6]);
            $classArmId = mysqli_real_escape_string($conn, $row[7]);
            $dateCreated = mysqli_real_escape_string($conn, $row[8]);

            // Insert student data into database
            $query = "INSERT INTO tblstudents (Id, firstName, lastName, otherName, admissionNumber, password, classId, classArmId, dateCreated) 
                      VALUES ('$id', '$firstName', '$lastName', '$otherName', '$admissionNumber', '$password', '$classId', '$classArmId', '$dateCreated')";
            mysqli_query($conn, $query);
        }

        // Close the file
        fclose($csv_file);

        // Set a message for success
        echo "<script>alert('CSV data imported successfully');</script>";
    } else {
        echo "<script>alert('Please upload a valid CSV file');</script>";
    }
}

// Fetch all students from the database
$students_query = "SELECT * FROM tblstudents";
$students_result = mysqli_query($conn, $students_query);

?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <link href="img/logo/attnlg.jpg" rel="icon">
  <title>Import Students</title>
  <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
  <link href="css/ruang-admin.min.css" rel="stylesheet">
</head>

<body id="page-top">
  <div id="wrapper">
    <!-- Sidebar -->
    <?php include "Includes/sidebar.php"; ?>
    <!-- Sidebar -->
    
    <div id="content-wrapper" class="d-flex flex-column">
      <div id="content">
        <!-- TopBar -->
        <?php include "Includes/topbar.php"; ?>
        <!-- Topbar -->

        <!-- Container Fluid-->
        <div class="container-fluid" id="container-wrapper">
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Import Students from CSV</h1>
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="./">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">Import Students</li>
            </ol>
          </div>

          <!-- Upload Form -->
          <div class="row">
            <div class="col-lg-12">
              <div class="card mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">Upload CSV File</h6>
                </div>
                <div class="card-body">
                  <form action="import.php" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                      <label for="csv_file">Choose CSV File</label>
                      <input type="file" name="csv_file" id="csv_file" class="form-control" required>
                    </div>
                    <button type="submit" name="upload" class="btn btn-primary">Upload</button>
                  </form>
                </div>
              </div>
            </div>
          </div>

          <!-- Display Uploaded Data -->
          <div class="row">
            <div class="col-lg-12">
              <div class="card mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">Uploaded Student Data</h6>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table table-bordered" width="100%" cellspacing="0">
                      <thead>
                        <tr>
                          <th>Id</th>
                          <th>First Name</th>
                          <th>Last Name</th>
                          <th>Middle Name</th>
                          <th>Admission Number</th>
                          <th>Password</th>
                          <th>Roll No</th>
                          <th>Class Div</th>
                          <th>Date Created</th>
                        </tr>
                      </thead>
                      <tbody>
                        <?php while($row = mysqli_fetch_assoc($students_result)): ?>
                        <tr>
                          <td><?php echo $row['Id']; ?></td>
                          <td><?php echo $row['firstName']; ?></td>
                          <td><?php echo $row['lastName']; ?></td>
                          <td><?php echo $row['otherName']; ?></td>
                          <td><?php echo $row['admissionNumber']; ?></td>
                          <td><?php echo $row['password']; ?></td>
                          <td><?php echo $row['classId']; ?></td>
                          <td><?php echo $row['classArmId']; ?></td>
                          <td><?php echo $row['dateCreated']; ?></td>
                        </tr>
                        <?php endwhile; ?>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>

        </div>
        <!---Container Fluid-->
      </div>
      <!-- Footer -->
      <?php include 'includes/footer.php'; ?>
      <!-- Footer -->
    </div>
  </div>

  <!-- Scroll to top -->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <script src="../vendor/jquery/jquery.min.js"></script>
  <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>
  <script src="js/ruang-admin.min.js"></script>
</body>

</html>
