// import ballerinax/mysql.driver as _;
// import ballerinax/mysql; 
// import ballerina/sql; 
import ballerina/io;
import ballerina/http;

// final mysql:Client dbClient1 = check new (
//         host="localhost", user="root", password="root", port=3306, database="test1", options = {useXADatasource: true}
//     );


public function main() returns error? {
    
    transaction {
        transaction:onCommit(commitdone);

        http:Client greetsClient = check new ("localhost:9090");
        // http:Client greetsClient = check new ("https://1d89fabc-cf2b-41b0-943c-8c1f69aad9ef-dev.e1-us-east-azure.choreoapis.dev/zkfd/transactiontestservice/endpoint-9090-803/1.0.0");
        // sql:ParameterizedQuery query1 = `UPDATE product_test SET price =250.00 WHERE id = 1`;            
        // _ = check dbClient1->execute(query1);
        // io:println("db updated");

        string|error response = check greetsClient->get("/greeting?name=John");
        io:println(response);
        check commit;
    }


}

isolated function commitdone('transaction:Info info) {
    io:println("Commit done.");
}