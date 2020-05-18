package DPO;

public class IPRequest {

//    private static final String ImgPerfil = "http://10.0.0.103:8087/Wissen/Imagens/ImagemPerfil/";
//    private static final String ImgEventCapa = "http://10.0.0.103:8087/Wissen/Imagens/ImagemEventoCapa/";
//    private static final String Usuario = "http://10.0.0.103:8087/Wissen/Web/Usuario/";
//    private static final String Eventos = "http://10.0.0.103:8087/Wissen/Web/Eventos/";
//    private static final String Denuncia = "http://10.0.0.103:8087/Wissen/Web/Denuncia/";
//    private static final String Seguidores = "http://10.0.0.103:8087/Wissen/Web/Seguidores/";
    
    private static final String ImgPerfil = "http://localhost:8087/Wissen/Imagens/ImagemPerfil/";
    private static final String ImgEventCapa = "http://localhost:8087/Wissen/Imagens/ImagemEventoCapa/";
    private static final String Usuario = "http://localhost:8087/Wissen/Web/Usuario/";
    private static final String Eventos = "http://localhost:8087/Wissen/Web/Eventos/";
    private static final String Denuncia = "http://localhost:8087/Wissen/Web/Denuncia/";
    private static final String Seguidores = "http://localhost:8087/Wissen/Web/Seguidores/";
    
//    private static final String ImgPerfil = "http://app.blindtech.com.br/Webservice/Imagens/ImagemPerfil/";
//    private static final String ImgEventCapa = "http://app.blindtech.com.br/Webservice/Imagens/ImagemEventoCapa/";
//    private static final String Usuario = "http://app.blindtech.com.br/Webservice/Web/Usuario/";
//    private static final String Eventos = "http://app.blindtech.com.br/Webservice/Web/Eventos/";
//    private static final String Denuncia = "http://app.blindtech.com.br/Webservice/Web/Denuncia/";
//    private static final String Seguidores = "http://app.blindtech.com.br/Webservice/Web/Seguidores/";

    public static String getImgPerfil() {
        return ImgPerfil;
    }

    public static String getImgEventCapa() {
        return ImgEventCapa;
    }

    public static String getUsuario() {
        return Usuario;
    }

    public static String getEventos() {
        return Eventos;
    }

    public static String getDenuncia() {
        return Denuncia;
    }

    public static String getSeguidores() {
        return Seguidores;
    }
}
