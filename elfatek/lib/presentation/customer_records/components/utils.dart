import '../../../domain/model/customer_registration.dart';

class Utils {
  static List<T> modelBuilder<M, T>(
          List<M> models, T Function(int index, M model) builder) =>
      models
          .asMap()
          .map<int, T>((index, model) => MapEntry(index, builder(index, model)))
          .values
          .toList();
  static List<CustomerRegistration> modelBuilder2<M, CustomerRegistration>(
          List<CustomerRegistration> models,
          CustomerRegistration Function(int index, CustomerRegistration model)
              builder) =>
      models
          .asMap()
          .map<int, CustomerRegistration>(
              (index, model) => MapEntry(index, builder(index, model)))
          .values
          .toList();
}
