
// ==========================================
// SKYHORIZON AIRLINES - AVALIAÇÃO FORMATIVA I
// ==========================================

// EXERCÍCIO 1 - Classes de apoio
class Passageiro {
  String? nome;
  String? cpf;
  String? rg;
  String? email;
  String? celular;
}

class PlataformaVenda {
  int? codigoCanal;
  String? nomeCanal;
}

class Atendente {
  String? nome;
  String? matricula;
  String? cargo;
  String? email;
  String? celular;
  double? salario;
}

// ==========================================
// EXERCÍCIOS 2 A 7 - CLASSE PASSAGEM
// ==========================================

class Passagem {
  // Atributo privado
  String? _codigoLocalizador = "";

  Passageiro? passageiro;
  PlataformaVenda? plataforma;
  Atendente? atendente;
  String? observacoes;

  // EXERCÍCIO 2 - Construtor não nomeado
  Passagem();

  // EXERCÍCIO 3 - Construtores nomeados
  Passagem.somenteCodigo(String codigoLocalizador) {
    _codigoLocalizador = codigoLocalizador;
  }

  Passagem.completa(
    String codigoLocalizador,
    this.passageiro,
    this.plataforma,
    this.atendente,
    this.observacoes,
  ) {
    _codigoLocalizador = codigoLocalizador;
  }

  // EXERCÍCIO 4 - Parâmetros nomeados
  Passagem.codigoEPassageiro({
    String? codigoLocalizador,
    this.passageiro,
  }) {
    _codigoLocalizador = codigoLocalizador;
  }

  Passagem.all(
    String codigoLocalizador, {
    required this.passageiro,
    required this.plataforma,
    required this.atendente,
    this.observacoes,
  }) {
    _codigoLocalizador = codigoLocalizador;
  }

  // EXERCÍCIO 5 - Getter e Setter tradicionais
  String? getCodigoLocalizador() {
    return _codigoLocalizador;
  }

  void setCodigoLocalizador(String? codigoLocalizador) {
    if (codigoLocalizador == null || codigoLocalizador.isEmpty) {
      print("Código localizador de passagem inválido!");
      return;
    }
    _codigoLocalizador = codigoLocalizador;
  }

  // EXERCÍCIO 6 - Getter e Setter nativos do Dart
  String? get codigoLocalizador => _codigoLocalizador;

  set codigoLocalizador(String? codigoLocalizador) {
    if (codigoLocalizador == null || codigoLocalizador.isEmpty) {
      print("Código localizador de passagem inválido!");
      return;
    }
    _codigoLocalizador = codigoLocalizador;
  }

  // EXERCÍCIO 7 - Métodos de negócio
  void emitirPassagem() {
    print("Passagem emitida com sucesso!");
  }

  bool cancelarPassagem() {
    print("Passagem cancelada com sucesso!");
    return true;
  }

  void atualizarPassagem() {
    print("Passagem atualizada com sucesso!");
  }

  Passagem consultarPassagem(String codigo) {
    print("Passagem consultada com sucesso!");
    return Passagem();
  }
}

// ==========================================
// EXERCÍCIO 9 - MIXINS
// ==========================================

mixin Logger {
  void log(String mensagem) {
    print(mensagem);
  }
}

mixin Auditoria {
  void auditar(String mensagem) {
    print("[Auditoria]: $mensagem");
  }
}

// ==========================================
// EXERCÍCIOS 8, 9 E 10
// HERANÇA, MIXINS E POLIMORFISMO
// ==========================================

class PassagemPrimeiraClasse extends Passagem with Logger, Auditoria {
  String? loungeAcesso;

  // EXERCÍCIO 8
  PassagemPrimeiraClasse(
    String codigoLocalizador,
    Passageiro? passageiro,
    PlataformaVenda? plataforma,
    Atendente? atendente,
    String? observacoes, {
    required this.loungeAcesso,
  }) : super.all(
          codigoLocalizador,
          passageiro: passageiro,
          plataforma: plataforma,
          atendente: atendente,
          observacoes: observacoes,
        );

  // EXERCÍCIO 10 - Sobrescrita polimórfica
  @override
  void atualizarPassagem() {
    print("Passagem de Primeira Classe atualizada com sucesso!");
    log("Alteração realizada pelo atendente: ${super.atendente?.nome}");
    auditar("Verificação de segurança realizada para a Primeira Classe.");
  }
}

// ==========================================
// MAIN - DEMONSTRAÇÃO DO SISTEMA
// ==========================================

void main() {
  print("===== SKYHORIZON AIRLINES =====\n");

  Passageiro passageiro = Passageiro()
    ..nome = "João Silva"
    ..cpf = "123.456.789-00"
    ..email = "joao@email.com"
    ..celular = "(11) 99999-9999";

  PlataformaVenda plataforma = PlataformaVenda()
    ..codigoCanal = 1
    ..nomeCanal = "Site SkyHorizon";

  Atendente atendente = Atendente()
    ..nome = "Maria Souza"
    ..matricula = "2026001"
    ..cargo = "Atendente"
    ..email = "maria@skyhorizon.com"
    ..celular = "(11) 98888-8888"
    ..salario = 3500.00;

  print("----- PASSAGEM PADRÃO -----");
  Passagem passagem1 = Passagem();
  passagem1.emitirPassagem();
  passagem1.atualizarPassagem();
  passagem1.cancelarPassagem();
  passagem1.consultarPassagem("ABC123");
  passagem1.setCodigoLocalizador("");
  passagem1.setCodigoLocalizador("ABC123");
  print("Código da passagem: ${passagem1.getCodigoLocalizador()}\n");

  print("----- PASSAGEM COM CONSTRUTOR ALL -----");
  Passagem passagem2 = Passagem.all(
    "XYZ789",
    passageiro: passageiro,
    plataforma: plataforma,
    atendente: atendente,
    observacoes: "Passagem emitida sem observações adicionais.",
  );
  print("Código: ${passagem2.codigoLocalizador}");
  print("Passageiro: ${passagem2.passageiro?.nome}");
  print("Plataforma: ${passagem2.plataforma?.nomeCanal}");
  print("Atendente: ${passagem2.atendente?.nome}");
  passagem2.emitirPassagem();
  print("");

  print("----- PASSAGEM PRIMEIRA CLASSE -----");
  PassagemPrimeiraClasse passagemVIP = PassagemPrimeiraClasse(
    "VIP001",
    passageiro,
    plataforma,
    atendente,
    "Cliente VIP",
    loungeAcesso: "SkyHorizon VIP Lounge",
  );
  print("Código: ${passagemVIP.codigoLocalizador}");
  print("Passageiro: ${passagemVIP.passageiro?.nome}");
  print("Lounge: ${passagemVIP.loungeAcesso}");
  passagemVIP.emitirPassagem();
  passagemVIP.atualizarPassagem();
  passagemVIP.log("Log do sistema registrado com sucesso.");
  passagemVIP.auditar("Auditoria final da passagem VIP concluída.");

  print("\n===== FIM DO SISTEMA =====");
}


//console:
//===== SKYHORIZON AIRLINES =====

//----- PASSAGEM PADRÃO -----
//Passagem emitida com sucesso!
//Passagem atualizada com sucesso!
//Passagem cancelada com sucesso!
//Passagem consultada com sucesso!
//Código localizador de passagem inválido!
//Código da passagem: ABC123

//----- PASSAGEM COM CONSTRUTOR ALL -----
//Código: XYZ789
//Passageiro: João Silva
//Plataforma: Site SkyHorizon
//Atendente: Maria Souza
//Passagem emitida com sucesso!

//----- PASSAGEM PRIMEIRA CLASSE -----
//Código: VIP001
//Passageiro: João Silva
//Lounge: SkyHorizon VIP Lounge
//Passagem emitida com sucesso!
//Passagem de Primeira Classe atualizada com sucesso!
//Alteração realizada pelo atendente: Maria Souza
//[Auditoria]: Verificação de segurança realizada para a Primeira Classe.
//Log do sistema registrado com sucesso.
//[Auditoria]: Auditoria final da passagem VIP concluída.

//===== FIM DO SISTEMA =====

