@isTest
global class TibcoBECalloutMock implements HttpCalloutMock{
    global HTTPResponse respond(HTTPRequest req){
        HTTPResponse resp = new HTTPResponse();
        resp.setHeader('Content-Type','application/json');
        resp.setBody('"Candidate" : { "attributes" : {"Id" : 3, "type" : "www.tibco.com/be/ontology/Concepts/Candidate" }'+
                    '"Candidate_Id" : "CD_1021", "Name" : "Jacque", "Evaluation" : "D", "Point" : 0}');
        return resp;
    }

}