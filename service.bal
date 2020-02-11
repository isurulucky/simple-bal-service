import ballerina/http;
import ballerina/log;
import ballerina/io;

listener http:Listener helloWorldEP = new(9091);

@http:ServiceConfig {
      basePath: "/helloWorld"
}
service helloWorld on helloWorldEP {
    resource function sayHello(http:Caller caller, http:Request request) {
        http:Response response = new;
        response.setTextPayload("Hello, World from Ballerina :D ! \n");
	io:println("Hello, World from Ballerina");
        var responseResult = caller->respond(response);
        if (responseResult is error) {
            log:printError("error responding back to client.", err = responseResult);
        }
    }
}

