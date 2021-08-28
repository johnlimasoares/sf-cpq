/**
*Author:John Lima
*US:0001
*Data:23/08/2021
**/
public class BuscaCepController {

    public static BuscaCepUseCase.Cep consultar(String cep) {
        BuscaCepUseCase useCase = new BuscaCepUseCase(new ViaCepCallOut());
        return useCase.consultar(cep);       
    }
}