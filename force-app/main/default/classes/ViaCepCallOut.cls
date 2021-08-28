public class ViaCepCallOut extends BaseCallOut implements BuscaCepUseCase.IConsultorCep {

    public BuscaCepUseCase.Cep consultar(String cep) {
         response = new HttpRestBuilder('ViaCep')
            .setPath(cep)
            .setPath('/json')
            .send();
        
        if(sucesso()) {
            ViaCepDTO viaCepDTO = (ViaCepDTO)JSON.deserialize(response.getBody(), ViaCepDTO.class);
            return viaCepDTO.toCep();
        } else {
            throw new ViaCepException(response.getBody());            
        }
    }
    
    public class ViaCepDTO {
        public string cep { get; set; }
        public string logradouro { get; set; }
        public string complemento { get; set; }
        public string bairro { get; set; }
        public string localidade { get; set; }
        public string uf { get; set; }
        public string ibge { get; set; }
        public string gia { get; set; }
        public string ddd { get; set; }
        public string siafi { get; set; }
        
        public BuscaCepUseCase.Cep toCep() {
            BuscaCepUseCase.Cep cep = new BuscaCepUseCase.Cep();
            
            cep.cep = this.cep;
            cep.logradouro = this.logradouro;
            cep.complemento = this.complemento;
            cep.bairro = this.bairro;
            cep.cidade = this.localidade;
            cep.uf = this.uf;
            cep.ibge = this.ibge;
            System.debug(JSON.serialize(cep));
            return cep;
        }
    }
    public class ViaCepException extends Exception {}
}