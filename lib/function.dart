import 'dart:io';
import 'dart:core';
////// ฟังก์ชั่น A
String FunctionA(List number){
  String functionA = '';
  for(int i=0; i<number.length; i++){
    if(int.parse(number[i])%2 == 0){
      functionA +='Even${number[i]}';
    } else {
      functionA +='Odd${number[i]}';
    }
  }
  return functionA;
}
////// ฟังก์ชั่น B
String FunctionB(String fA){
  String fB = fA.toUpperCase();
  String functionB = '';
  // เช็คว่ามี ODD กับ EVEN มั้ย
  if(fB.indexOf('ODD') != -1 || fB.indexOf('EVEN') != -1){
    functionB += fB.replaceAll('ODD', 'DDO').replaceAll('EVEN', 'NEVE'); // แทนODD ด้วย DDO กับ แทน EVEN ด้วย NEVE
  }
  return functionB;
}
////// ฟังก์ชั่น C
String FunctionC(String fB){
  String fC = fB;
  String functionC = '';
  for(int i=0; i<fC.length; i++){
    if(fC.codeUnitAt(i) < 65 ){
      functionC += fC.substring(i, i+1); // ถ้าตรงตามเงื่อนไข คือน้อยกว่า65 แสดงว่าเป็นตัวเลข ไม่ทำเป็น ascii
    }else {
      functionC += '${fC.codeUnitAt(i)}'; // ไม่เข้าเงื่อนไขแรกทำเป็น ascii
    }
  }
  return functionC;
}
////// ฟังก์ชั่น D
String FunctionD(String fB){
  String functionD = fB;
  return functionD;
}
////// ฟังก์ชั่น E
String FunctionE(String fA){
  String functionE = fA;
  return functionE;
}
////// ฟังก์ชั่น F
String FunctionF(String numb){
  String functionF = numb;
  return functionF;
}
void main() {

  print('╔══════════════════════════════════════════════════════');
  print('║                     หมูมะนาวฟังก์ชั่น                    ');
  print('║──────────────────────────────────────────────────────');

  do {
    stdout.write('║ กรุณาใส่เลข 0 ถึง 20:');
    var input = stdin.readLineSync();
    // เช็คว่าค่าที่ใส่เป็นตัวเลขมั้ย
    var num = int.tryParse(input!);
    if (num == null) {
      continue;
    }
    //เปลี่ยน int เป็น string
    String numb = num.toString();
    // ทำเลขหลักสิบ ให้เป็น 2 ตัว
    List number = numb.runes.map((rune) => new String.fromCharCode(rune)).toList();
    // ส่งค่าให้แต่ละฟังก์ชั่น
    var fA = FunctionA(number);
    var fB = FunctionB(fA);
    var fC = FunctionC(fB);
    var fD = FunctionD(fB);
    var fE = FunctionD(fA);
    var fF = FunctionF(numb);
    print('║ Function A: $fA');
    print('║ Function B: $fB');
    print('║ Function C: $fC');
    print('║ Function D: $fD');
    print('║ Function E: $fE');
    print('║ Function F: $fF');
    print('║──────────────────────────────────────────────────────');
    print('║                        THE END                ');
    print('║══════════════════════════════════════════════════════');
  } while (true);
}
