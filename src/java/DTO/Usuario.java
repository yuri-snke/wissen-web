package DTO;

public class Usuario {

    private static String Id_User;
    private static String Nome;
    private static String Sobrenome;
    private static String Email;
    private static String Senha;
    private static String Idade;
    private static String Genero;
    private static String PalavraSec;
    private static String Celular;
    private static String Cep;
    private static String Estado;
    private static String Cidade;
    private static String Endereco;
    private static String Foto;
    private static int privado;
    private static String Preferencias;
    private static String Latitude;
    private static String Logitude;
    private static boolean premium = false;

    public static boolean isPremium() {
        return premium;
    }

    public static void setPremium(boolean premium) {
        Usuario.premium = premium;
    }

    public static String getId_User() {
        return Id_User;
    }

    public static void setId_User(String Id_User) {
        Usuario.Id_User = Id_User;
    }

    public static String getEmail() {
        return Email;
    }

    public static void setEmail(String Email) {
        Usuario.Email = Email;
    }

    public static String getSenha() {
        return Senha;
    }

    public static void setSenha(String Senha) {
        Usuario.Senha = Senha;
    }

    public static String getGenero() {
        return Genero;
    }

    public static void setGenero(String Genero) {
        Usuario.Genero = Genero;
    }

    public static String getEndereco() {
        return Endereco;
    }

    public static void setEndereco(String Endereco) {
        Usuario.Endereco = Endereco;
    }

    public static int getPrivado() {
        return privado;
    }

    public static void setPrivado(int privado) {
        Usuario.privado = privado;
    }

    public static String getPreferencias() {
        return Preferencias;
    }

    public static void setPreferencias(String Preferencias) {
        Usuario.Preferencias = Preferencias;
    }

    public static String getLatitude() {
        return Latitude;
    }

    public static void setLatitude(String Latitude) {
        Usuario.Latitude = Latitude;
    }

    public static String getLogitude() {
        return Logitude;
    }

    public static void setLogitude(String Logitude) {
        Usuario.Logitude = Logitude;
    }

    public static String getNome() {
        return Nome;
    }

    public static void setNome(String Nome) {
        Usuario.Nome = Nome;
    }

    public static String getSobrenome() {
        return Sobrenome;
    }

    public static void setSobrenome(String Sobrenome) {
        Usuario.Sobrenome = Sobrenome;
    }

    public static String getIdade() {
        return Idade;
    }

    public static void setIdade(String Idade) {
        Usuario.Idade = Idade;
    }

    public static String getPalavraSec() {
        return PalavraSec;
    }

    public static void setPalavraSec(String PalavraSec) {
        Usuario.PalavraSec = PalavraSec;
    }

    public static String getCelular() {
        return Celular;
    }

    public static void setCelular(String Celular) {
        Usuario.Celular = Celular;
    }

    public static String getCep() {
        return Cep;
    }

    public static void setCep(String Cep) {
        Usuario.Cep = Cep;
    }

    public static String getEstado() {
        return Estado;
    }

    public static void setEstado(String Estado) {
        Usuario.Estado = Estado;
    }

    public static String getCidade() {
        return Cidade;
    }

    public static void setCidade(String Cidade) {
        Usuario.Cidade = Cidade;
    }

    public static String getFoto() {
        return Foto;
    }

    public static void setFoto(String Foto) {
        Usuario.Foto = Foto;
    }

}
