import 'package:comida_app_naranja/models/comida.dart';
import 'package:comida_app_naranja/models/comida_complementaria.dart';

var comidaDisponible = [
  Comida(
    imagenUrl: 'assets/images/fileteCarne.png',
    nombre: 'Filete de carne',
    precio: 20.00,
    descripcion:
        'Un corte premium de carne jugosa y tierna, cocinado a la perfección y acompañado de guarniciones frescas y sabrosas.',
    comidaComplementaria: comidaextraDisponible,
  ),
  Comida(
    imagenUrl: 'assets/images/fritada.png',
    nombre: 'Fritada',
    precio: 6.00,
    descripcion:
        'Una explosión de sabor con trozos crujientes de cerdo sazonados, fritos hasta alcanzar un dorado perfecto y servidos con complementos deliciosos.',
    comidaComplementaria: comidaextraDisponible,
  ),
  Comida(
    imagenUrl: 'assets/images/Guatita.png',
    nombre: 'Guatita',
    precio: 4.00,
    descripcion:
        ' Un platillo tradicional que combina sabores auténticos y texturas únicas, resaltando los ingredientes locales en una presentación cautivante.',
    comidaComplementaria: comidaextraDisponible,
  ),
  Comida(
    imagenUrl: 'assets/images/encebollado.png',
    nombre: 'Encebollado',
    precio: 5.00,
    descripcion:
        'Una reconfortante sopa de pescado con un caldo abundante y fragante, realzado con cebollas y especias que te transportarán a la costa.',
    comidaComplementaria: comidaextraDisponible,
  ),
  Comida(
    imagenUrl: 'assets/images/hamburguesa-bbq.png',
    nombre: 'Hamburguesa Bbq',
    precio: 13.50,
    descripcion:
        'Nuestra interpretación de la hamburguesa clásica, con una generosa porción de carne jugosa y una irresistible salsa barbacoa que deleitará tus sentidos.',
    comidaComplementaria: comidaextraDisponible,
  ),
  Comida(
    imagenUrl: 'assets/images/vareniky.png',
    nombre: 'Vareniky',
    precio: 15.00,
    descripcion:
        'Deliciosos dumplings rellenos de ingredientes frescos y sabrosos, cocidos al vapor y servidos con salsas que te harán salivar.',
    comidaComplementaria: comidaextraDisponible,
  ),
  Comida(
    imagenUrl: 'assets/images/pechugaPollo.png',
    nombre: 'Pechuga de pollo',
    precio: 12.00,
    descripcion:
        'Una opción saludable y llena de sabor, nuestra pechuga de pollo está cuidadosamente cocinada para mantener su jugosidad, acompañada de acompañamientos saludables.',
    comidaComplementaria: comidaextraDisponible,
  ),
  Comida(
    imagenUrl: 'assets/images/salmon-trigueros-judias.png',
    nombre: 'Trigueros con Judias',
    precio: 12.00,
    descripcion:
        'Una combinación de sabores refinados y nutritivos, donde el salmón se complementa con verduras frescas de temporada.',
    comidaComplementaria: comidaextraDisponible,
  ),
  Comida(
    imagenUrl: 'assets/images/sopa-borsch.png',
    nombre: 'Sopa Borsch',
    precio: 12.00,
    descripcion:
        'Una explosión de colores y sabores en cada cucharada, nuestra sopa borsch es una receta clásica llena de vegetales y carne, sazonada con maestría.',
    comidaComplementaria: comidaextraDisponible,
  ),
  Comida(
    imagenUrl: 'assets/images/papascarnequeso.png',
    nombre: 'Papas con Carne molida',
    precio: 12.00,
    descripcion:
        'Una mezcla reconfortante de ingredientes que satisfacen los antojos, con papas suaves, carne molida sazonada y queso gratinado.',
    comidaComplementaria: comidaextraDisponible,
  ),
];

var comidaextraDisponible = [
  ComidaComplementaria(
    imagenUrl: 'assets/images/bebida_de_fruta.png',
    nombre: 'Bebida de frutas',
    descripcion:
        'Jugo de frutas frescas y jugosas que te harán sentir revitalizado y lleno de energía.',
    precio: 1.50,
  ),
  ComidaComplementaria(
    imagenUrl: 'assets/images/chifle.jpg',
    nombre: 'Chifle',
    descripcion:
        'Plátanos en rodajas finas y crujientes, perfectamente fritas para convertirse en un bocado adictivo.',
    precio: 1.00,
  ),
  ComidaComplementaria(
    imagenUrl: 'assets/images/canguil.jpg',
    nombre: 'Canguil',
    descripcion:
        'Nuestras palomitas de maíz son aireadas, crujientes y llenas de sabor.',
    precio: 1.00,
  ),
  ComidaComplementaria(
    imagenUrl: 'assets/images/cafe.png',
    nombre: 'Cafe',
    descripcion:
        'Café excepcionalmente aromático y revitalizante que satisfará tus sentidos.',
    precio: 1.00,
  ),
  ComidaComplementaria(
    imagenUrl: 'assets/images/pan-de-ajo.jpg',
    nombre: 'Pan de ajo',
    descripcion: 'Delicioso pan horneado con ajo y mantequilla.',
    precio: 1.50,
  ),
];
