package DTO;

public class Evento {

    private String id;
    private String Nome;
    private String DataIni;
    private String DataTer;
    private String HoraIni;
    private String HoraTer;
    private String Responsavel;
    private String Preco;
    private String Descricao;
    private String Imagens;
    private String ImagemCapa;
    private String CEP;
    private String Estado;
    private String Cidade;
    private String Bairro;
    private String Local;
    private String Endereco;
    private String TelFixo;
    private String TelMovel;
    private String EmailCriador;
    private String Tipo;
    private String CpfCnpj;
    private int Privado;
    private int Confianca;
    private int Premium;
    private int Interessados;
    private int Comparecerao;
    private int Compareceram;
    private String latitude;
    private String longitude;

    public String getLatitude() {
        return latitude;
    }

    public void setLatitude(String latitude) {
        this.latitude = latitude;
    }

    public String getLongitude() {
        return longitude;
    }

    public void setLongitude(String longitude) {
        this.longitude = longitude;
    }

    public void limpa() {
        this.id = null;

        this.Nome = null;

        this.DataIni = null;

        this.DataTer = null;

        this.HoraIni = null;

        this.HoraTer = null;

        this.Responsavel = null;

        this.Preco = null;

        this.Descricao = null;

        this.Imagens = null;

        this.ImagemCapa = null;

        this.CEP = null;

        this.Local = null;

        this.Endereco = null;

        this.TelFixo = null;

        this.TelMovel = null;

        this.EmailCriador = null;

        this.Tipo = null;

        this.CpfCnpj = null;

        this.Privado = -1;

        this.Confianca = -1;

        this.Premium = -1;

        this.Interessados = -1;

        this.Comparecerao = -1;

        this.Compareceram = -1;
    }

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String Estado) {
        this.Estado = Estado;
    }

    public String getCidade() {
        return Cidade;
    }

    public void setCidade(String Cidade) {
        this.Cidade = Cidade;
    }

    public String getBairro() {
        return Bairro;
    }

    public void setBairro(String Bairro) {
        this.Bairro = Bairro;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNome() {
        return Nome;
    }

    public void setNome(String Nome) {
        this.Nome = Nome;
    }

    public String getDataIni() {
        return DataIni;
    }

    public void setDataIni(String DataIni) {
        this.DataIni = DataIni;
    }

    public String getDataTer() {
        return DataTer;
    }

    public void setDataTer(String DataTer) {
        this.DataTer = DataTer;
    }

    public String getHoraIni() {
        return HoraIni;
    }

    public void setHoraIni(String HoraIni) {
        this.HoraIni = HoraIni;
    }

    public String getHoraTer() {
        return HoraTer;
    }

    public void setHoraTer(String HoraTer) {
        this.HoraTer = HoraTer;
    }

    public String getResponsavel() {
        return Responsavel;
    }

    public void setResponsavel(String Responsavel) {
        this.Responsavel = Responsavel;
    }

    public String getPreco() {
        return Preco;
    }

    public void setPreco(String Preco) {
        this.Preco = Preco;
    }

    public String getDescricao() {
        return Descricao;
    }

    public void setDescricao(String Descricao) {
        this.Descricao = Descricao;
    }

    public String getImagens() {
        return Imagens;
    }

    public void setImagens(String Imagens) {
        this.Imagens = Imagens;
    }

    public String getImagemCapa() {
        return ImagemCapa;
    }

    public void setImagemCapa(String ImagemCapa) {
        this.ImagemCapa = ImagemCapa;
    }

    public String getCEP() {
        return CEP;
    }

    public void setCEP(String CEP) {
        this.CEP = CEP;
    }

    public String getLocal() {
        return Local;
    }

    public void setLocal(String Local) {
        this.Local = Local;
    }

    public String getEndereco() {
        return Endereco;
    }

    public void setEndereco(String Endereco) {
        this.Endereco = Endereco;
    }

    public String getTelFixo() {
        return TelFixo;
    }

    public void setTelFixo(String TelFixo) {
        this.TelFixo = TelFixo;
    }

    public String getTelMovel() {
        return TelMovel;
    }

    public void setTelMovel(String TelMovel) {
        this.TelMovel = TelMovel;
    }

    public String getEmailCriador() {
        return EmailCriador;
    }

    public void setEmailCriador(String EmailCriador) {
        this.EmailCriador = EmailCriador;
    }

    public String getTipo() {
        return Tipo;
    }

    public void setTipo(String Tipo) {
        this.Tipo = Tipo;
    }

    public String getCpfCnpj() {
        return CpfCnpj;
    }

    public void setCpfCnpj(String CpfCnpj) {
        this.CpfCnpj = CpfCnpj;
    }

    public int getPrivado() {
        return Privado;
    }

    public void setPrivado(int Privado) {
        this.Privado = Privado;
    }

    public int getConfianca() {
        return Confianca;
    }

    public void setConfianca(int Confianca) {
        this.Confianca = Confianca;
    }

    public int getPremium() {
        return Premium;
    }

    public void setPremium(int Premium) {
        this.Premium = Premium;
    }

    public int getInteressados() {
        return Interessados;
    }

    public void setInteressados(int Interessados) {
        this.Interessados = Interessados;
    }

    public int getComparecerao() {
        return Comparecerao;
    }

    public void setComparecerao(int Comparecerao) {
        this.Comparecerao = Comparecerao;
    }

    public int getCompareceram() {
        return Compareceram;
    }

    public void setCompareceram(int Compareceram) {
        this.Compareceram = Compareceram;
    }

}
