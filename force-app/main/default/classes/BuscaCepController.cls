public class BuscaCepController {

    public static BuscaCepUseCase.Cep consultar(String cep) {
        BuscaCepUseCase useCase = new BuscaCepUseCase(new ViaCepCallOut());
        return useCase.consultar(cep);       
    }
}