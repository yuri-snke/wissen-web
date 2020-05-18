package DAO;

import DPO.EventoRequest;
import DTO.Evento;
import DTO.FollowersEvent;
import DTO.Usuario;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;


// DAOEvento - Responsavel por todos os dados inseridos/recuperados pelo webService.


public class DAOEvento {

    public Evento PegaEvento(String response, Map<String, Object> params) { //Metodo que recebe o caminho e os parametros que serão inseridos no .php e retorna um evento.

        try {
            URL url = new URL(response);  //Cria uma conexao com a url
            StringBuilder postData = new StringBuilder();
            for (Map.Entry<String, Object> param : params.entrySet()) { // coloca os parametros
                if (postData.length() != 0) {
                    postData.append('&');
                }
                postData.append(URLEncoder.encode(param.getKey(), "UTF-8"));
                postData.append('=');
                postData.append(URLEncoder.encode(String.valueOf(param.getValue()), "UTF-8"));
            }

            byte[] postDataBytes = postData.toString().getBytes("UTF-8");

            HttpURLConnection connection = (HttpURLConnection) url.openConnection();

            connection.setRequestMethod("POST");                 //Seta propriedades
            connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            connection.setRequestProperty("Content-Length", String.valueOf(postDataBytes.length));
            connection.setRequestProperty("Accept-Charset", "UTF-8");
            connection.setDoOutput(true);
            connection.getOutputStream().write(postDataBytes);

            connection.disconnect(); //Fecha a conexao
            BufferedReader rd = new BufferedReader(new InputStreamReader(connection.getInputStream(), "UTF-8")); //recebe o retorno do WebService
            String line;

            if ((line = rd.readLine()) != null) {
                JSONArray array = new JSONArray(line); //Cria uma JSONArray (Uma Lista) com base na linha retornada

                JSONObject object = array.getJSONObject(0); // Pega o primeiro da Lista

                Evento event = new Evento(); //Cria um evento
                event.setId(object.getString("id")); //Insere os dados do JSON no Evento
                event.setNome(object.getString("Nome"));
                event.setDataIni(object.getString("DataInicio"));
                event.setDataTer(object.getString("DataTermino"));
                event.setHoraIni(object.getString("HoraInicio"));
                event.setHoraTer(object.getString("HoraTermino"));
                event.setResponsavel(object.getString("Responsavel"));
                event.setPreco(object.getString("Preco"));
                event.setDescricao(object.getString("Descricao"));
                event.setImagens(object.getString("Imagens"));
                event.setImagemCapa(object.getString("ImagemCapa"));
                event.setCEP(object.getString("CEP"));
                event.setEstado(object.getString("Estado"));
                event.setCidade(object.getString("Cidade"));
                event.setBairro(object.getString("Bairro"));
                event.setLocal(object.getString("Local"));
                event.setEndereco(object.getString("Endereco"));
                event.setTelFixo(object.getString("TelFixo"));
                event.setTelMovel(object.getString("TelMovel"));
                event.setEmailCriador(object.getString("EmailCriador"));
                event.setTipo(object.getString("Tipo"));
                event.setCpfCnpj(object.getString("CpfCnpj"));
                event.setPrivado(object.getInt("Privado"));
                event.setConfianca(object.getInt("Confianca"));
                event.setPremium(object.getInt("Premium"));
                event.setInteressados(object.getInt("Interessados"));
                event.setComparecerao(object.getInt("Comparecerao"));
                event.setCompareceram(object.getInt("Compareceram"));

                return event; // Retorna o evento

            }

        } catch (MalformedURLException | UnsupportedEncodingException | JSONException | NullPointerException ex) {
            Logger.getLogger(DAOUsuario.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(DAOUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Evento> ResponseRequest(String response, Map<String, Object> params) {
        ArrayList<Evento> erro = new ArrayList<>();
        try {
            URL url = new URL(response);
            StringBuilder postData = new StringBuilder();
            for (Map.Entry<String, Object> param : params.entrySet()) {
                if (postData.length() != 0) {
                    postData.append('&');
                }
                postData.append(URLEncoder.encode(param.getKey(), "UTF-8"));
                postData.append('=');
                postData.append(URLEncoder.encode(String.valueOf(param.getValue()), "UTF-8"));
            }

            byte[] postDataBytes = postData.toString().getBytes("UTF-8");

            HttpURLConnection connection = (HttpURLConnection) url.openConnection();

            connection.setRequestMethod("POST");
            connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            connection.setRequestProperty("Content-Length", String.valueOf(postDataBytes.length));
            connection.setRequestProperty("Accept-Charset", "UTF-8");
            connection.setDoOutput(true);
            connection.getOutputStream().write(postDataBytes);

            connection.disconnect();
            BufferedReader rd = new BufferedReader(new InputStreamReader(connection.getInputStream(), "UTF-8"));
            String line;

            if ((line = rd.readLine()) != null) {
                JSONArray json = new JSONArray(line);
                ArrayList<Evento> array = new ArrayList<>();
                String[] eventosListados = new String[50];
                int count = 0;
                int w = 0;
                while (w < json.length()) {
                    JSONObject object = json.getJSONObject(w);
                    Evento event = new Evento();
                    event.setId(object.getString("id"));
                    event.setNome(object.getString("Nome"));
                    event.setDataIni(object.getString("DataInicio"));
                    event.setDataTer(object.getString("DataTermino"));
                    event.setHoraIni(object.getString("HoraInicio"));
                    event.setHoraTer(object.getString("HoraTermino"));
                    event.setResponsavel(object.getString("Responsavel"));
                    event.setPreco(object.getString("Preco"));
                    event.setDescricao(object.getString("Descricao"));
                    event.setImagens(object.getString("Imagens"));
                    event.setImagemCapa(object.getString("ImagemCapa"));
                    event.setCEP(object.getString("CEP"));
                    event.setLocal(object.getString("Local"));
                    event.setEstado(object.getString("Estado"));
                    event.setCidade(object.getString("Cidade"));
                    event.setBairro(object.getString("Bairro"));
                    event.setEndereco(object.getString("Endereco"));
                    event.setTelFixo(object.getString("TelFixo"));
                    event.setTelMovel(object.getString("TelMovel"));
                    event.setEmailCriador(object.getString("EmailCriador"));
                    event.setTipo(object.getString("Tipo"));
                    event.setCpfCnpj(object.getString("CpfCnpj"));
                    event.setPrivado(object.getInt("Privado"));
                    event.setConfianca(object.getInt("Confianca"));
                    event.setPremium(object.getInt("Premium"));
                    event.setInteressados(object.getInt("Interessados"));
                    event.setComparecerao(object.getInt("Comparecerao"));
                    event.setCompareceram(object.getInt("Compareceram"));

                    if (vericaLista(object.getString("id"), eventosListados, count)) {
                        eventosListados[count] = object.getString("id");
                        array.add(event);
                        count++;
                    }
                    w++;
                }
                return array;

            }

        } catch (MalformedURLException | UnsupportedEncodingException | NullPointerException ex) {
            Logger.getLogger(DAOUsuario.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(DAOUsuario.class.getName()).log(Level.SEVERE, null, ex);
        } catch (JSONException js) {
            return erro;
        }
        return null;
    }

    public ArrayList<FollowersEvent> RequestFollowersEvents(String response, Map<String, Object> params) {

        try {
            URL url = new URL(response);
            StringBuilder postData = new StringBuilder();
            for (Map.Entry<String, Object> param : params.entrySet()) {
                if (postData.length() != 0) {
                    postData.append('&');
                }
                postData.append(URLEncoder.encode(param.getKey(), "UTF-8"));
                postData.append('=');
                postData.append(URLEncoder.encode(String.valueOf(param.getValue()), "UTF-8"));
            }

            byte[] postDataBytes = postData.toString().getBytes("UTF-8");

            HttpURLConnection connection = (HttpURLConnection) url.openConnection();

            connection.setRequestMethod("POST");
            connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            connection.setRequestProperty("Content-Length", String.valueOf(postDataBytes.length));
            connection.setRequestProperty("Accept-Charset", "UTF-8");
            connection.setDoOutput(true);
            connection.getOutputStream().write(postDataBytes);

            connection.disconnect();
            BufferedReader rd = new BufferedReader(new InputStreamReader(connection.getInputStream(), "UTF-8"));
            String line;
            if ((line = rd.readLine()) != null) {
                JSONArray json = new JSONArray(line);
                ArrayList<FollowersEvent> array = new ArrayList<>();
                String[] eventosListados = new String[50];
                int count = 0;
                int w = 0;
                while (w < json.length()) {
                    JSONObject object = json.getJSONObject(w);
                    FollowersEvent event = new FollowersEvent();
                    event.setId(object.getString("id"));
                    event.setNome(object.getString("Nome"));
                    event.setDataIni(object.getString("DataInicio"));
                    event.setDataTer(object.getString("DataTermino"));
                    event.setHoraIni(object.getString("HoraInicio"));
                    event.setHoraTer(object.getString("HoraTermino"));
                    event.setResponsavel(object.getString("Responsavel"));
                    event.setPreco(object.getString("Preco"));
                    event.setDescricao(object.getString("Descricao"));
                    event.setImagens(object.getString("Imagens"));
                    event.setImagemCapa(object.getString("ImagemCapa"));
                    event.setCEP(object.getString("CEP"));
                    event.setEstado(object.getString("Estado"));
                    event.setCidade(object.getString("Cidade"));
                    event.setBairro(object.getString("Bairro"));
                    event.setLocal(object.getString("Local"));
                    event.setEndereco(object.getString("Endereco"));
                    event.setTelFixo(object.getString("TelFixo"));
                    event.setTelMovel(object.getString("TelMovel"));
                    event.setEmailCriador(object.getString("EmailCriador"));
                    event.setTipo(object.getString("Tipo"));
                    event.setCpfCnpj(object.getString("CpfCnpj"));
                    event.setPrivado(object.getInt("Privado"));
                    event.setConfianca(object.getInt("Confianca"));
                    event.setPremium(object.getInt("Premium"));
                    event.setInteressados(object.getInt("Interessados"));
                    event.setComparecerao(object.getInt("Comparecerao"));
                    event.setCompareceram(object.getInt("Compareceram"));
                    event.setId_User(object.getString("id_User"));
                    event.setNome_User(object.getString("nome_User"));
                    event.setImagemPerfil_User(object.getString("imagemPerfil_User"));

                    if (vericaLista(object.getString("id"), eventosListados, count)) {
                        eventosListados[count] = object.getString("id");
                        array.add(event);
                        count++;
                    }
                    w++;
                }
                return array;

            }

        } catch (MalformedURLException | UnsupportedEncodingException | JSONException | NullPointerException ex) {
            Logger.getLogger(DAOUsuario.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(DAOUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<FollowersEvent> RequestLembreteEvents(String response, Map<String, Object> params) {

        try {
            URL url = new URL(response);
            StringBuilder postData = new StringBuilder();
            for (Map.Entry<String, Object> param : params.entrySet()) {
                if (postData.length() != 0) {
                    postData.append('&');
                }
                postData.append(URLEncoder.encode(param.getKey(), "UTF-8"));
                postData.append('=');
                postData.append(URLEncoder.encode(String.valueOf(param.getValue()), "UTF-8"));
            }

            byte[] postDataBytes = postData.toString().getBytes("UTF-8");

            HttpURLConnection connection = (HttpURLConnection) url.openConnection();

            connection.setRequestMethod("POST");
            connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            connection.setRequestProperty("Content-Length", String.valueOf(postDataBytes.length));
            connection.setRequestProperty("Accept-Charset", "UTF-8");
            connection.setDoOutput(true);
            connection.getOutputStream().write(postDataBytes);

            connection.disconnect();
            BufferedReader rd = new BufferedReader(new InputStreamReader(connection.getInputStream(), "UTF-8"));
            String line;
            if ((line = rd.readLine()) != null) {
                JSONArray json = new JSONArray(line);
                ArrayList<FollowersEvent> array = new ArrayList<>();
                String[] eventosListados = new String[50];
                int count = 0;
                int w = 0;
                while (w < json.length()) {
                    JSONObject object = json.getJSONObject(w);
                    FollowersEvent event = new FollowersEvent();
                    event.setId(object.getString("id"));
                    event.setNome(object.getString("Nome"));
                    event.setDataIni(object.getString("DataInicio"));
                    event.setDataTer(object.getString("DataTermino"));
                    event.setHoraIni(object.getString("HoraInicio"));
                    event.setHoraTer(object.getString("HoraTermino"));
                    event.setResponsavel(object.getString("Responsavel"));
                    event.setPreco(object.getString("Preco"));
                    event.setDescricao(object.getString("Descricao"));
                    event.setImagens(object.getString("Imagens"));
                    event.setImagemCapa(object.getString("ImagemCapa"));
                    event.setCEP(object.getString("CEP"));
                    event.setEstado(object.getString("Estado"));
                    event.setCidade(object.getString("Cidade"));
                    event.setBairro(object.getString("Bairro"));
                    event.setLocal(object.getString("Local"));
                    event.setEndereco(object.getString("Endereco"));
                    event.setTelFixo(object.getString("TelFixo"));
                    event.setTelMovel(object.getString("TelMovel"));
                    event.setEmailCriador(object.getString("EmailCriador"));
                    event.setTipo(object.getString("Tipo"));
                    event.setCpfCnpj(object.getString("CpfCnpj"));
                    event.setPrivado(object.getInt("Privado"));
                    event.setConfianca(object.getInt("Confianca"));
                    event.setPremium(object.getInt("Premium"));
                    event.setInteressados(object.getInt("Interessados"));
                    event.setComparecerao(object.getInt("Comparecerao"));
                    event.setCompareceram(object.getInt("Compareceram"));
                    event.setStatusFollow(object.getString("Status"));

                    if (vericaLista(object.getString("id"), eventosListados, count)) {
                        eventosListados[count] = object.getString("id");
                        array.add(event);
                        count++;
                    }
                    w++;
                }
                return array;

            }

        } catch (MalformedURLException | UnsupportedEncodingException | JSONException | NullPointerException ex) {
            Logger.getLogger(DAOUsuario.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(DAOUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    private boolean vericaLista(String string, String[] eventos, int count) {
        for (int w = 0; w < count; w++) {
            if (string.equals(eventos[w])) {
                return false;
            }
        }
        return true;
    }

    public static boolean Seguir(String id_User, String id_Evento, String status, String interessados, String comparecerao) {
        Map<String, Object> params = new LinkedHashMap<>();
        params.put("id_User", id_User);
        params.put("id_Evento", id_Evento);
        params.put("status", status);
        params.put("comparecerao", comparecerao);
        params.put("interessados", interessados);
        return CadastroRequest(EventoRequest.getSeguirEvento(), params);
    }

    public static boolean Cadastro(Evento evento, String foto1, String foto2, String foto3) {
        try {
            Map<String, Object> params = new LinkedHashMap<>();
            params.put("Nome", URLEncoder.encode(evento.getNome(), "UTF-8"));
            params.put("DataInicio", evento.getDataIni());
            params.put("DataTermino", evento.getDataTer());
            params.put("HoraInicio", evento.getHoraIni());
            params.put("HoraTermino", evento.getHoraTer());
            params.put("Responsavel", URLEncoder.encode(evento.getResponsavel(), "UTF-8"));
            params.put("Preco", evento.getPreco());
            params.put("Descricao", URLEncoder.encode(evento.getDescricao(), "UTF-8"));

            String NomeFoto1 = GeraFoto();

            if (foto2 != null) {
                String NomeFoto2 = GeraFoto();
                if (foto3 != null) {
                    String NomeFoto3 = GeraFoto();
                    params.put("Imagens", NomeFoto2 + ";" + NomeFoto3);
                    params.put("VerificaImagens", 23);
                    params.put("foto2", foto2);
                    params.put("NomeFoto2", NomeFoto2);
                    params.put("foto3", foto3);
                    params.put("NomeFoto3", NomeFoto3);
                } else {
                    params.put("Imagens", NomeFoto2);
                    params.put("VerificaImagens", 2);
                    params.put("foto2", foto2);
                    params.put("NomeFoto2", NomeFoto2);
                }
            } else {

                if (foto3 != null) {
                    String NomeFoto3 = GeraFoto();
                    params.put("Imagens", NomeFoto3);
                    params.put("VerificaImagens", 3);
                    params.put("foto3", foto3);
                    params.put("NomeFoto3", NomeFoto3);
                } else {
                    params.put("Imagens", "SemImagem");
                    params.put("VerificaImagens", 0);
                }

            }

            params.put("ImagemCapa", URLEncoder.encode(NomeFoto1, "UTF-8"));
            params.put("CEP", evento.getCEP());
            params.put("Estado", URLEncoder.encode(evento.getEstado(), "UTF-8"));
            params.put("Cidade", URLEncoder.encode(evento.getCidade(), "UTF-8"));
            params.put("Bairro", URLEncoder.encode(evento.getBairro(), "UTF-8"));
            params.put("Local", URLEncoder.encode(evento.getLocal(), "UTF-8"));
            params.put("Endereco", URLEncoder.encode(evento.getEndereco(), "UTF-8"));
            params.put("TelFixo", evento.getTelFixo());
            params.put("TelMovel", evento.getTelMovel());
            params.put("EmailCriador", Usuario.getEmail());
            params.put("Tipo", evento.getTipo());
            params.put("CpfCnpj", evento.getCpfCnpj());
            params.put("Privado", evento.getPrivado());
            params.put("foto1", foto1);
            params.put("NomeFoto1", NomeFoto1);
            params.put("Latitude", evento.getLatitude());
            params.put("Longitude", evento.getLongitude());

            return CadastroRequest(EventoRequest.getCadastro(), params);
        } catch (UnsupportedEncodingException ex) {
            Logger.getLogger(DAOEvento.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public static boolean Atualizar(Evento evento, String foto1, String foto2, String foto3) {
        try {
            Map<String, Object> params = new LinkedHashMap<>();
            params.put("Id", evento.getId());
            params.put("Nome", URLEncoder.encode(evento.getNome(), "UTF-8"));

            params.put("DataInicio", evento.getDataIni());
            params.put("DataTermino", evento.getDataTer());
            params.put("HoraInicio", evento.getHoraIni());
            params.put("HoraTermino", evento.getHoraTer());
            params.put("Responsavel", URLEncoder.encode(evento.getResponsavel(), "UTF-8"));
            params.put("Preco", evento.getPreco());
            params.put("Descricao", URLEncoder.encode(evento.getDescricao(), "UTF-8"));
            String NomeFoto1 = evento.getImagemCapa();
            String NomeFoto2 = "";
            String NomeFoto3 = "";
            if (evento.getImagens().equals("SemImagem")) {
                NomeFoto2 = GeraFoto();
                NomeFoto3 = GeraFoto();
            } else {
                String imagens[] = evento.getImagens().split(";");
                NomeFoto2 = imagens[0];
                if (imagens.length > 1) {
                    NomeFoto3 = imagens[1];
                }
            }

            if (evento.getImagemCapa().equals("SemImagemCapa")) {
                NomeFoto1 = GeraFoto();
            }
            if (foto2 != null) {

                if (foto3 != null) {

                    params.put("Imagens", NomeFoto2 + ";" + NomeFoto3);
                    params.put("VerificaImagens", 23);
                    params.put("foto2", foto2);
                    params.put("NomeFoto2", NomeFoto2);
                    params.put("foto3", foto3);
                    params.put("NomeFoto3", NomeFoto3);
                } else {
                    params.put("Imagens", NomeFoto2);
                    params.put("VerificaImagens", 2);
                    params.put("foto2", foto2);
                    params.put("NomeFoto2", NomeFoto2);
                }
            } else {

                if (foto3 != null) {
                    params.put("Imagens", NomeFoto3);
                    params.put("VerificaImagens", 3);
                    params.put("foto3", foto3);
                    params.put("NomeFoto3", NomeFoto3);
                } else {
                    params.put("Imagens", "SemImagem");
                    params.put("VerificaImagens", 0);
                }

            }
            params.put("ImagemCapa", URLEncoder.encode(NomeFoto1, "UTF-8"));
            params.put("CEP", evento.getCEP());
            params.put("Estado", URLEncoder.encode(evento.getEstado(), "UTF-8"));
            params.put("Cidade", URLEncoder.encode(evento.getCidade(), "UTF-8"));
            params.put("Bairro", URLEncoder.encode(evento.getBairro(), "UTF-8"));
            params.put("Local", URLEncoder.encode(evento.getLocal(), "UTF-8"));
            params.put("Endereco", URLEncoder.encode(evento.getEndereco(), "UTF-8"));
            params.put("TelFixo", evento.getTelFixo());
            params.put("TelMovel", evento.getTelMovel());
            params.put("EmailCriador", Usuario.getEmail());
            params.put("Tipo", evento.getTipo());
            params.put("CpfCnpj", evento.getCpfCnpj());
            params.put("Privado", evento.getPrivado());
            params.put("foto1", foto1);
            params.put("NomeFoto1", NomeFoto1);

            return CadastroRequest(EventoRequest.getAtualizar(), params);
        } catch (UnsupportedEncodingException ex) {
            Logger.getLogger(DAOEvento.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public static String GeraFoto() {
        StringBuilder sb = new StringBuilder();
        int qtdChars = 1;
        while (qtdChars <= 35) {
            int charInt = (int) (Math.random() * 91);
            if (((charInt >= 48) && (charInt <= 57)) || ((charInt >= 65) && (charInt <= 90))) {
                char c = (char) charInt;
                sb.append(c);
                qtdChars++;
            }
        }
        return sb.toString() + ".jpg";
    }

    private static boolean CadastroRequest(String listaEventos, Map<String, Object> params) {
        try {
            URL url = new URL(listaEventos);
            StringBuilder postData = new StringBuilder();
            for (Map.Entry<String, Object> param : params.entrySet()) {
                if (postData.length() != 0) {
                    postData.append('&');
                }
                postData.append(URLEncoder.encode(param.getKey(), "UTF-8"));
                postData.append('=');
                postData.append(URLEncoder.encode(String.valueOf(param.getValue()), "UTF-8"));
            }

            byte[] postDataBytes = postData.toString().getBytes("UTF-8");
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("POST");
            connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            connection.setRequestProperty("Content-Length", String.valueOf(postDataBytes.length));
            connection.setRequestProperty("Accept-Charset", "UTF-8");
            connection.setDoOutput(true);
            connection.getOutputStream().write(postDataBytes);

            connection.disconnect();
            BufferedReader rd = new BufferedReader(new InputStreamReader(connection.getInputStream(), "UTF-8"));
            String line;
            
            
            
            
            if ((line = rd.readLine()) != null) {
                
                    JSONObject jsonResponse = new JSONObject(line);
                    boolean success = jsonResponse.getBoolean("success");
                    return success;
                
            }

        } catch (MalformedURLException | UnsupportedEncodingException | JSONException | NullPointerException ex) {
            return false;
            
        } catch (IOException ex) {
            Logger.getLogger(DAOUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean Denuncia(String motivo, String desc, String id) {
        Map<String, Object> params = new LinkedHashMap<>();
        params.put("Email_User", DTO.Usuario.getEmail());
        params.put("Id_Evento", id);
        params.put("Motivo", motivo);
        params.put("Descricao", desc);

        try {
            URL url = new URL(DPO.EventoRequest.getDenuncia());
            StringBuilder postData = new StringBuilder();
            for (Map.Entry<String, Object> param : params.entrySet()) {
                if (postData.length() != 0) {
                    postData.append('&');
                }
                postData.append(URLEncoder.encode(param.getKey(), "UTF-8"));
                postData.append('=');
                postData.append(URLEncoder.encode(String.valueOf(param.getValue()), "UTF-8"));
            }

            byte[] postDataBytes = postData.toString().getBytes("UTF-8");
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("POST");
            connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            connection.setRequestProperty("Content-Length", String.valueOf(postDataBytes.length));
            connection.setRequestProperty("Accept-Charset", "UTF-8");
            connection.setDoOutput(true);
            connection.getOutputStream().write(postDataBytes);

            connection.disconnect();
            BufferedReader rd = new BufferedReader(new InputStreamReader(connection.getInputStream(), "UTF-8"));
            String line;

            if ((line = rd.readLine()) != null) {
                JSONObject jsonResponse = new JSONObject(line);
                boolean success = jsonResponse.getBoolean("success");
                return success;
            }

        } catch (MalformedURLException | UnsupportedEncodingException | JSONException | NullPointerException ex) {
            Logger.getLogger(DAOUsuario.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(DAOUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;

    }

    public boolean Excluir(String id) {
        Map<String, Object> params = new LinkedHashMap<>();
        params.put("id", id);
        try {
            URL url = new URL(DPO.EventoRequest.getExcluir());
            StringBuilder postData = new StringBuilder();
            for (Map.Entry<String, Object> param : params.entrySet()) {
                if (postData.length() != 0) {
                    postData.append('&');
                }
                postData.append(URLEncoder.encode(param.getKey(), "UTF-8"));
                postData.append('=');
                postData.append(URLEncoder.encode(String.valueOf(param.getValue()), "UTF-8"));
            }

            byte[] postDataBytes = postData.toString().getBytes("UTF-8");
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("POST");
            connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            connection.setRequestProperty("Content-Length", String.valueOf(postDataBytes.length));
            connection.setRequestProperty("Accept-Charset", "UTF-8");
            connection.setDoOutput(true);
            connection.getOutputStream().write(postDataBytes);

            connection.disconnect();
            BufferedReader rd = new BufferedReader(new InputStreamReader(connection.getInputStream(), "UTF-8"));
            String line;

            if ((line = rd.readLine()) != null) {
                JSONObject jsonResponse = new JSONObject(line);
                boolean success = jsonResponse.getBoolean("success");
                return success;
            }

        } catch (MalformedURLException | UnsupportedEncodingException | JSONException | NullPointerException ex) {
            Logger.getLogger(DAOUsuario.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(DAOUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;

    }

}
