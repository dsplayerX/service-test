import ballerina/http;
import ballerina/io;

# A service representing a network-accessible API
# bound to port `9090`.
service / on new http:Listener(9090) {

    # A resource for generating greetings
    # + name - the input string name
    # + return - string name with hello message or error
    transactional resource function get greeting(string name) returns string|error {
        io:println(transactional ? "transactional" : "non-transactional");
        // Send a response back to the caller.
        if name is "" {
            return error("name should not be empty!");
        }
        if transactional {
            return "Hello, " + name + " - transactional";
        } else {
            return "Hello, " + name + " - non-transactional";
        }
            
    }
}
