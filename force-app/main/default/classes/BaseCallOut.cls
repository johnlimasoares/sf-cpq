public abstract class BaseCallOut {
    protected HttpResponse response {get; set;}
    
    protected Boolean sucesso() {return response.getStatusCode() == 200;}
}