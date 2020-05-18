package DPO;

import DTO.Usuario;

public class EventoRequest {

    public EventoRequest() {
        setRecomendados();
    }
    private String[] Recomendados = setRecomendados();
    private String id = DTO.Usuario.getId_User();

    private static final String ListaEventos = IPRequest.getEventos() + "List.php";
    private static final String ListaEventosRecomendados = IPRequest.getEventos() + "ListHighElo.php";
    private static final String Cadastro = IPRequest.getEventos() + "Cadastro.php";
    private static final String Atualizar = IPRequest.getEventos() + "Atualizar.php";
    private static final String SeguirEvento = IPRequest.getSeguidores() + "FollowEvent.php";
    private static final String Excluir = IPRequest.getEventos() + "Excluir.php";
    private static final String Denuncia = IPRequest.getDenuncia() + "Denuncia.php";

    private static final String SqlTodos = "Select * from tbl_eventos ORDER BY Comparecerao ASC";
    private static final String SqlTodoUser = "Select * from tbl_usuarios where Privado != 1 ORDER BY Nome ASC";
    private static final String SqlNPremium = "Select * from tbl_eventos where Premium = 0 ORDER BY Comparecerao ASC";
    private static final String SqlPremium = "Select * from tbl_eventos where Premium = 1 ORDER BY Comparecerao ASC";
    private static final String SqlPegaUm = "Select * from tbl_eventos where id = ";
    private static final String SqlPesquisa = "SELECT DISTINCT * FROM `tbl_eventos` as ev WHERE ev.Nome LIKE '%CHANGE%'OR ev.Tipo LIKE '%CHANGE%' OR ev.Cidade LIKE '%CHANGE%' OR ev.Estado LIKE '%CHANGE%' OR ev.Bairro LIKE '%CHANGE%' OR ev.Local LIKE '%CHANGE%' ORDER BY Comparecerao ASC";
    private static final String SqlPesquisaUser = "Select * from tbl_usuarios where nome LIKE '%";
    private static final String SqlComparecerei = "UPDATE `tbl_eventos` SET `CAMPO` = 'CAMPOVALOR' WHERE `tbl_eventos`.`id` = ID";

    private final String SqlListEvSeguidos = "SELECT ev.*, evSeg.Status FROM tbl_eventosseg AS evSeg, tbl_eventos AS ev WHERE evSeg.Id_Evento = ev.id and evSeg.Id_usuario = " + id + " and evSeg.Status != 0 ORDER BY Comparecerao ASC";
    private final String SqlListEvSeguidosFollow = "SELECT ev.*, evSeg.Status FROM tbl_eventosseg AS evSeg, tbl_eventos AS ev WHERE evSeg.Id_Evento = ev.id and evSeg.Id_usuario = ID and evSeg.Status != 0 ORDER BY Comparecerao ASC";
    private final String SqlListMeusEvFollow = "SELECT * FROM tbl_eventos WHERE EmailCriador = 'EMAIL' ORDER BY Comparecerao ASC";

    private final String SqlListEvFollSeg = "SELECT DISTINCT ev.*, evSeg.Status, usu.id_User, usu.Nome as nome_User, usu.ImagemPerfil as imagemPerfil_User FROM tbl_usuarios usu, tbl_eventosseg AS evSeg, tbl_eventos AS ev, tbl_seguidores AS segui WHERE segui.UserPrimario = " + id + " AND evSeg.Id_usuario = segui.UserSecundario AND evSeg.Id_Evento = ev.id AND usu.id_User = segui.UserSecundario ORDER BY Comparecerao ASC";
    private final String SqlListMeuEventos = "SELECT * FROM tbl_eventos WHERE EmailCriador = '" + Usuario.getEmail() + "' ORDER BY Comparecerao ASC";
    private final String SqlLista1 = "SELECT * FROM `tbl_eventos` WHERE Tipo Like '%" + this.Recomendados[0] + "%' AND Tipo Like '%" + this.Recomendados[1] + "%' AND Tipo Like '%" + this.Recomendados[2] + "%' AND Premium = 0 ORDER BY Comparecerao ASC";
    private final String SqlLista2 = "SELECT * FROM `tbl_eventos` WHERE Tipo Like '%" + this.Recomendados[0] + "%' AND Tipo Like '%" + Recomendados[1] + "%' AND Premium = 0 ORDER BY Comparecerao ASC";
    private final String SqlLista3 = "SELECT * FROM `tbl_eventos` WHERE Tipo Like '%" + this.Recomendados[1] + "%' AND Tipo Like '%" + this.Recomendados[2] + "%' AND Premium = 0 ORDER BY Comparecerao ASC";
    private final String SqlLista4 = "SELECT * FROM `tbl_eventos` WHERE Tipo Like '%" + this.Recomendados[0] + "%' AND Tipo Like '%" + this.Recomendados[2] + "%' AND Premium = 0 ORDER BY Comparecerao ASC";
    private final String SqlLista5 = "SELECT * FROM `tbl_eventos` WHERE Tipo Like '%" + this.Recomendados[0] + "%' AND Premium = 0 ORDER BY Comparecerao ASC";
    private final String SqlLista6 = "SELECT * FROM `tbl_eventos` WHERE Tipo Like '%" + this.Recomendados[1] + "%' AND Premium = 0 ORDER BY Comparecerao ASC";
    private final String SqlLista7 = "SELECT * FROM `tbl_eventos` WHERE Tipo Like '%" + this.Recomendados[2] + "%' AND Premium = 0 ORDER BY Comparecerao ASC";

    public String getSqlListMeusEvFollow() {
        return SqlListMeusEvFollow;
    }

    public String getSqlListEvSeguidosFollow() {
        return SqlListEvSeguidosFollow;
    }

    public static String getDenuncia() {
        return Denuncia;
    }

    public static String getExcluir() {
        return Excluir;
    }

    public static String getSqlComparecerei() {
        return SqlComparecerei;
    }

    public static String getSeguirEvento() {
        return SeguirEvento;
    }

    public static String getAtualizar() {
        return Atualizar;
    }

    public static String getSqlTodoUser() {
        return SqlTodoUser;
    }

    public static String getSqlPesquisaUser() {
        return SqlPesquisaUser;
    }

    public static String getSqlPesquisa() {
        return SqlPesquisa;
    }

    public static String getSqlPegaUm() {
        return SqlPegaUm;
    }

    public String getSqlListMeuEventos() {
        return SqlListMeuEventos;
    }

    public static String getCadastro() {
        return Cadastro;
    }

    public String getSqlListEvFollSeg() {
        return this.SqlListEvFollSeg;
    }

    public String getSqlListEvSeguidos() {
        return this.SqlListEvSeguidos;
    }

    public static String[] setRecomendados() {
        return DTO.Usuario.getPreferencias().trim().split(";");
    }

    public static String getListaEventosRecomendados() {
        return ListaEventosRecomendados;
    }

    public String getSqlLista1() {
        return SqlLista1;
    }

    public String getSqlLista2() {
        return SqlLista2;
    }

    public String getSqlLista3() {
        return SqlLista3;
    }

    public String getSqlLista4() {
        return SqlLista4;
    }

    public String getSqlLista5() {
        return SqlLista5;
    }

    public String getSqlLista6() {
        return SqlLista6;
    }

    public String getSqlLista7() {
        return SqlLista7;
    }

    public static String getSqlNPremium() {
        return SqlNPremium;
    }

    public static String getSqlTodos() {
        return SqlTodos;
    }

    public static String getSqlPremium() {
        return SqlPremium;
    }

    public static String getListaEventos() {
        return ListaEventos;
    }

}
