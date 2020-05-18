package DTO;

public class DenunEvento {
 
    static String Email_User;
    static String Id_Evento;
    static String Motivo;
    static String Descricao;

    public static String getEmail_User() {
        return Email_User;
    }

    public static void setEmail_User(String Email_User) {
        DenunEvento.Email_User = Email_User;
    }

    public static String getId_Evento() {
        return Id_Evento;
    }

    public static void setId_Evento(String Id_Evento) {
        DenunEvento.Id_Evento = Id_Evento;
    }

    public static String getMotivo() {
        return Motivo;
    }

    public static void setMotivo(String Motivo) {
        DenunEvento.Motivo = Motivo;
    }

    public static String getDescricao() {
        return Descricao;
    }

    public static void setDescricao(String Descricao) {
        DenunEvento.Descricao = Descricao;
    }
    
}