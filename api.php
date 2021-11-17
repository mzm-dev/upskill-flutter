<?php
header("content-type:application/json");

header("Access-Control-Allow-Origin: *");

header('Access-Control-Allow-Methods: GET, POST');

//Class API
$api = new Api();

if (isset($_GET['action'])) {

    $action = $_GET['action'];

    switch ($action) {
        case 'login':
            # code...
            echo json_encode($api->login($_POST));
            break;

        case 'semak':
            # code...            
            echo json_encode($api->semak($_POST));

            break;
        case 'daftar':
            # code...
            echo json_encode($api->daftar($_POST));
            break;

        default:
            # code...            
            echo json_encode($api->invalid('Invalid request'));
            break;
    }
} else {
    echo json_encode($api->invalid('Bad request'));
    die;
}


class Api
{
    private $db;

    public function __construct()
    {
        $this->connection();
    }

    private function connection()
    {
        $DB_SERVER = 'localhost';
        $DB_USERNAME = 'root';
        $DB_PASSWORD = 'password';
        $DB_NAME = 'database';

        try {
            $this->db = new PDO("mysql:host=" . $DB_SERVER . ";dbname=" . $DB_NAME, $DB_USERNAME, $DB_PASSWORD);
            $this->db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch (PDOException $e) {
            die("ERROR: Could not connect. " . $e->getMessage());
        }
    }

    /**
     * Invalid response
     */
    public function invalid($title)
    {
        # code...
        return ['success' => false, 'message' => $title];
    }

    
    /**
     * Semakan
     */
    public function semak($data)
    {
        // 1. Query SQL statement
        $sql = "SELECT * FROM users WHERE nokp=:nokp";

        // 2. Prepare a select statement
        $stmt = $this->db->prepare($sql);

        // 3. Set parameters
        $param_nokp = $data['nokp'];

        // 4. Bind variables to the prepared statement as parameters
        $stmt->bindParam(":nokp", $param_nokp, PDO::PARAM_INT);

        // 5. Attempt to execute the prepared statement
        if ($stmt->execute()) {

            // 6. Check if username exists, if yes then verify password
            if ($stmt->rowCount() > 0) {

                /* Fetch all result row as an associative array.*/
                $results  = $stmt->fetchAll(PDO::FETCH_ASSOC);

                //status data Successful                
                return $results;
            } else {
                //status data empty                
                return false;
            }
        } else {
            //execute the prepared statement error            
            return false;
        }
    }

    /**
     * Daftar
     */
    public function daftar($data)
    {

        // 1. Query SQL statement
        $sql = "INSERT INTO users (nama,nokp, emel, katalaluan) VALUES (:nama, :nokp, :emel, :katalaluan)";

        // 2. Prepare a select statement
        $stmt = $this->db->prepare($sql);

        // 3. Set parameters
        $param_nokp = $data['nokp'];
        $param_nama = $data['nama'];
        $param_emel = $data['emel'];
        $param_katalaluan = password_hash("password", PASSWORD_BCRYPT);
        
        // 4. Bind variables to the prepared statement as parameters
        $stmt->bindParam(":nokp", $param_nokp, PDO::PARAM_INT);
        $stmt->bindParam(":nama", $param_nama, PDO::PARAM_STR);
        $stmt->bindParam(":katalaluan", $param_katalaluan, PDO::PARAM_STR);        

        // 5. Attempt to execute the prepared statement
        if ($stmt->execute()) {
            
            return true;
        } else {
            return false;
        }
    }

    /**
     * Daftar
     */
    public function login($data)
    {

        if (isset($data['nokp']) &&  isset($data['katalaluan'])) {

            $nokp = $data['nokp'];
            $katalaluan = $data['katalaluan'];

            // 1. Query SQL statement 
            $sql = "SELECT * FROM kakitangan WHERE nokp=:nokp";

            // 2. Prepare a select statement
            $stmt = $this->db->prepare($sql);

            // 3. Set parameters
            $param_nokp = $data['nokp'];

            // 4. Bind variables to the prepared statement as parameters
            $stmt->bindParam(":nokp", $param_nokp, PDO::PARAM_INT);

            // 5. Attempt to execute the prepared statement
            if ($stmt->execute()) {

                // 7. Check if username exists, if yes then verify password
                if ($stmt->rowCount() > 0) {

                    $row = $stmt->fetch();

                    if (password_verify($katalaluan,$row['katalaluan'])) {

                        return [
                            'id' => $row['IdStaf'],
                            'nokp' => $row['nokp'],
                            'nama' => $row['nama'],
                            'emel' => $row['emel'],
                        ];
                    }
                    return false;
                }
                return false;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }
}
