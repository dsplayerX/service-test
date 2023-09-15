import ballerina/http;

// int counter;


# A service representing a network-accessible API
# bound to port `9090`.
service / on new http:Listener(9090) {
    // function init() {
    //     counter = 0;
    // }

    transactional resource function get greeting(string name) returns string {
        return "Hello, " + name + "!";
    }
}
