package DPO;

public class UsuarioRequest {

    private String id = DTO.Usuario.getId_User();

    private static final String CadastraPrefRequest = IPRequest.getUsuario() + "Update.php";
    private static final String CadastraUsuarioRequest = IPRequest.getUsuario() + "Register.php";
    private static final String CadastraFotoRequest = IPRequest.getUsuario() + "UploadImagem.php";
    private static final String VerificaRequest = IPRequest.getUsuario() + "PegaUm.php";
    private static final String FollowRequest = IPRequest.getSeguidores() + "FollowUser.php";
    private static final String VerificaFollowRequest = IPRequest.getSeguidores() + "Verifica.php";
    private static final String FollowRequest12 = IPRequest.getUsuario() + "Follow.php";
    private static final String LoginRequest = IPRequest.getUsuario() + "Login.php";
    private static final String AtualizaPerfilRequest = IPRequest.getUsuario() + "AtualizaPerfil.php";
    private static final String AtualizaPerfilSegRequest = IPRequest.getUsuario() + "AtualizaPerfil.php";
    private static final String PegaOutrosRequest = IPRequest.getUsuario() + "PegaOutros.php";
    private static final String SetPrivadoRequest = IPRequest.getUsuario() + "SetPrivado.php";
    private static final String ListSeguidores = IPRequest.getUsuario() + "ListSeguidores.php";
    private static final String InsertPremium = IPRequest.getUsuario() + "InsertPremium.php";

    private final String SqlListSeguidores = "SELECT usu.* FROM tbl_usuarios AS usu, tbl_seguidores AS segui WHERE segui.UserPrimario = " + id + " AND segui.UserSecundario = usu.id_User";
    private final static String SqlFollow = "SELECT * from tbl_usuarios where Email = ";
    private static final String SqlPegaUm = "Select * from tbl_usuarios where id_User = ";

    public static String getVerificaFollowRequest() {
        return VerificaFollowRequest;
    }

    public static String getFollowRequest() {
        return FollowRequest;
    }

    public static String getSqlPegaUm() {
        return SqlPegaUm;
    }

    public static String getSqlFollow() {
        return SqlFollow;
    }

    public static String getInsertPremium() {
        return InsertPremium;
    }

    public String getSqlListSeguidores() {
        return SqlListSeguidores;
    }

    public static String getListSeguidores() {
        return ListSeguidores;
    }

    public static String getSetPrivadoRequest() {
        return SetPrivadoRequest;
    }

    public static String getPegaOutrosRequest() {
        return PegaOutrosRequest;
    }

    public static String getAtualizaPerfilSegRequest() {
        return AtualizaPerfilSegRequest;
    }

    public static String getAtualizaPerfilRequest() {
        return AtualizaPerfilRequest;
    }

    public static String getCadastraPrefRequest() {
        return CadastraPrefRequest;
    }

    public static String getCadastraUsuarioRequest() {
        return CadastraUsuarioRequest;
    }

    public static String getCadastraFotoRequest() {
        return CadastraFotoRequest;
    }

    public static String getVerificaRequest() {
        return VerificaRequest;
    }

    public static String getLoginRequest() {
        return LoginRequest;
    }

}
