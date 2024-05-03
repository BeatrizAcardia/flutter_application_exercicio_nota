class cadastro{
  String nome = " ";
  int crm = 0;
  bool permitir = false;
  List<String> formacao = [];

 cadastro(this.nome, this.crm, this.formacao, this.permitir);

 String get getNome => this.nome;

 set setNome(String nome) => this.nome = nome;

  get getCrm => this.crm;

 set setCrm( crm) => this.crm = crm;

  get getPermitir => this.permitir;

 set setPermitir( permitir) => this.permitir = permitir;

  get getFormacao => this.formacao;

 set setFormacao( formacao) => this.formacao = formacao;
}