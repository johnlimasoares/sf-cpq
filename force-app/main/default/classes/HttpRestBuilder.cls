public class HttpRestBuilder {
	private HttpRequest httpRequest;
    private HttpResponse httpResponse;
    private Request_Parameters__c customSettings;
    private final Integer DEFAULT_TIMEOUT = 20000;
    
    public HttpRestBuilder() {
    	this.httpRequest = new HttpRequest();
        this.httpResponse = new HttpResponse();
    }
    
    public HttpRestBuilder(String customSettings) {
    	this();
        this.customSettings = Request_Parameters__c.getInstance(customSettings);
        if(this.customSettings == null) {
            //throw new Exception('Não foi possível encontrar a custom metadata:' + claroEndpoint);
        }
        fillParamsConfig();
    }
    
    public HttpRestBuilder setHeader(Map<String,String> headers) {
        if (headers != null && !headers.isEmpty()){
			for (String key : headers.keySet()){
				if (headers.get(key) != null){
					this.httpRequest.setHeader(key, headers.get(key));
				}
			}
		}
        return this;
    }
    
    public HttpRestBuilder setBody(String body) {
        this.httpRequest.setBody(body);
        return this;
    }
    
    public HttpRestBuilder setMethod(String method) {
        this.httpRequest.setMethod(method);
        return this;
    }
    
    public HttpRestBuilder setTimeout(Integer timeout) {
        this.httpRequest.setTimeout(timeout == null ? DEFAULT_TIMEOUT : timeout);
        return this;
    }
    
    public HttpRestBuilder setEndpoint(String endpoint) {
        this.httpRequest.setEndpoint(endpoint);
        return this;
    }
    
    public HttpRestBuilder setPath(String path) {
        String endpoint = this.httpRequest.getEndpoint() + path;
        this.httpRequest.setEndpoint(endpoint);
        return this;
    }
    
    public HttpRestBuilder setContentType(String contentType) {
        this.httpRequest.setHeader('Content-Type', contentType);
        return this;
    }
    
    public HttpResponse send() {
        HTTP http = new HTTP();
        return http.send(this.httpRequest);
    }
    
    private void fillParamsConfig() {
        setEndpoint('callout:' + this.customSettings.Named_Credential__c + this.customSettings.Endpoint__c);
        setMethod(this.customSettings.Method__c);
        setContentType(this.customSettings.Content_type__c);
        setTimeout(Integer.valueOf(this.customSettings.Timeout__c));
    }
    
    public HttpRestBuilder setParams(Map<String, String> mapParams) {
		if (mapParams != null && !mapParams.isEmpty()) {
            String endpoint = this.httpRequest.getEndpoint();
			endpoint += buildStringParameter(mapParams);
            setEndpoint(endpoint);
		}		
        return this;
	}
    
    private String buildStringParameter(Map<String, String> parameters) {
        String params = '?';
		Boolean isFirstParameter = true;
		for (String key : parameters.keySet()){
			if (isFirstParameter){
				params += key + '=' + parameters.get(key);
                isFirstParameter = false;
			}else{
				params += '&' + key + '=' + parameters.get(key);
			}			
		}
		return params;
	}
   
}