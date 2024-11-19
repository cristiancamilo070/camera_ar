import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:object_detection/presentation/home/pages/home_page.dart';

void main() {
  testWidgets('El texto de instrucciones se muestra correctamente',
      (WidgetTester tester) async {
    // Configuración inicial
    await tester.pumpWidget(
      GetMaterialApp(
        home: HomePage(),
      ),
    );

    // Verifica que el título de instrucciones esté presente
    expect(find.text('Instrucciones para usar la cámara AR:'), findsOneWidget);

    // Verifica que los pasos estén presentes
    expect(
      find.text('1. Asegúrate de estar en un lugar con buena iluminación.'),
      findsOneWidget,
    );
    expect(
      find.text(
          '2. Mueve el dispositivo lentamente para detectar superficies.'),
      findsOneWidget,
    );
    expect(
      find.text(
          '3. Una vez que se detecte una superficie, selecciona un punto.'),
      findsOneWidget,
    );
    expect(
      find.text(
          '4. Aparecerá un cubo en el punto seleccionado. Puedes moverlo tocando en otra área.'),
      findsOneWidget,
    );
    expect(
      find.text('5. Usa los botones inferiores para rotar el cubo.'),
      findsOneWidget,
    );
  });
}
