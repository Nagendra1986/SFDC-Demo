@RestResource(urlMapping='/TestRest/*')
global class MyRestService {


@HttpGet
global static void doPost() {
/*RestRequest req = RestContext.request;
RestResponse res= RestContext.response;

Blob bPl = req.requestBody;
String strMsg = String.valueOf(bPl);

res.statusCode = 200;

res.responseBody = bPl;*/

RestContext.response.addHeader('Content-Type', 'text/plain');
String name = RestContext.request.params.get('name');
RestContext.response.responseBody = Blob.valueOf('Hello '+name);
} }