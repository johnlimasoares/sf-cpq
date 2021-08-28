public class BuscaCepUseCase {
	private IConsultorCep consultor;
    
    public BuscaCepUseCase(IConsultorCep consultor) {
        this.consultor = consultor;
    }
    
    public Cep consultar(String cep) {        
       return consultor.consultar(cep);
    }
    
    //gravar endereço
    
    
   
    public interface IConsultorCep {
		BuscaCepUseCase.Cep consultar(String cep);
	}
    
    public class Cep {
        public string cep { get; set; }
        public string logradouro { get; set; }
        public string complemento { get; set; }
        public string bairro { get; set; }
        public string cidade { get; set; }
        public string uf { get; set; }
        public string ibge { get; set; }                      
    }
}