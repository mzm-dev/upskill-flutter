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
        case 'kursus':
            # code...            
            echo json_encode($api->kursus());

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
        $DB_NAME = 'dbkursus';

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
     * Senarai Kursus
     */
    public function kursus()
    {
        # code...
        // 1. Query SQL statement
        $tarikh = date('Y-m-d');
        $sql = "SELECT * FROM kursus WHERE StatusKursus = 'AKTIF' AND TarikhMula>='$tarikh'
        ORDER BY TarikhTamatMohon DESC";

        // 2. Prepare a select statement
        $stmt = $this->db->prepare($sql);

        // 3. Attempt to execute the prepared statement
        if ($stmt->execute()) {

            // 6. Check if username exists, if yes then verify password
            if ($stmt->rowCount() > 0) {

                /* Fetch all result row as an associative array.*/
                $results  = $stmt->fetchAll(PDO::FETCH_ASSOC);

                //status data Successful
                // return [
                //     'success' => true, 'message' => "Successful",
                //     'data' => $results
                // ];
                return $results;
            } else {
                //status data empty
                // return [
                //     'success' => false, 'message' => "The data empty"
                // ];
                return false;
            }
        } else {
            //execute the prepared statement error
            // return [
            //     'success' => false, 'message' => "Nothing found or problem with the query"
            // ];
            return false;
        }
    }

    /**
     * Semakan
     */
    public function semak($data)
    {
        // 1. Query SQL statement
        $sql = "SELECT b.* FROM permohonan a, kursus b 
                                        WHERE a.IdKursus = b.IdKursus AND (a.No_KP=:nokp) 
                                        AND YEAR(b.TarikhMula)=:tahunTarikhMula 
                                        AND YEAR(b.TarikhTamat)=:tahunTarikhTamat 
                                        ORDER BY IdPermohonan";

        // 2. Prepare a select statement
        $stmt = $this->db->prepare($sql);

        // 3. Set parameters
        $param_nokp = $data['nokp'];
        $param_year = date('Y');

        // 4. Bind variables to the prepared statement as parameters
        $stmt->bindParam(":nokp", $param_nokp, PDO::PARAM_INT);
        $stmt->bindParam(":tahunTarikhMula", $param_year, PDO::PARAM_INT);
        $stmt->bindParam(":tahunTarikhTamat", $param_year, PDO::PARAM_INT);

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
        $sql = "INSERT INTO user (user_id,user_email, user_role) VALUES (:idkursus, :nokp, :nama)";

        // 2. Prepare a select statement
        $stmt = $this->db->prepare($sql);

        // 3. Set parameters
        $param_idkursus = $data['idkursus'] . rand(1, 200);
        $param_nokp = $data['nokp'];
        $param_nama = $data['nama'];

        // 4. Bind variables to the prepared statement as parameters
        $stmt->bindParam(":idkursus", $param_idkursus, PDO::PARAM_INT);
        $stmt->bindParam(":nokp", $param_nokp, PDO::PARAM_INT);
        $stmt->bindParam(":nama", $param_nama, PDO::PARAM_STR);

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

            //This string tells crypt to use blowfish for 5 rounds.
            $Blowfish_Pre = '$2a$05$';
            $Blowfish_End = '$';

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

                    $hashed_pass = crypt($katalaluan, $Blowfish_Pre . $row['katalaluan_salt'] . $Blowfish_End);

                    if ($hashed_pass == $row['katalaluan']) {

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
