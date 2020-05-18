package DTO;

public class FaleConosco {

    static String Email;
    static String Assunto;
    static String Mensagem;

    public static String getEmail() {
        return Email;
    }

    public static void setEmail(String Email) {
        FaleConosco.Email = Email;
    }

    public static String getAssunto() {
        return Assunto;
    }

    public static void setAssunto(String Assunto) {
        FaleConosco.Assunto = Assunto;
    }

    public static String getMensagem() {
        return Mensagem;
    }

    public static void setMensagem(String Mensagem) {
        FaleConosco.Mensagem = Mensagem;
    }

}