abstract class BaseViewModel with BaseViewModelInput, BaseViewModelOutput {}

mixin BaseViewModelInput {
  void start();
  void dispose();
}

mixin BaseViewModelOutput {

}