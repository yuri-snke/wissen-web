package DAO;

import DPO.UsuarioRequest;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
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

public class DAOUsuario {

    public static boolean CadastraFoto(String base) throws ProtocolException, IOException {

        try {

            URL url = new URL(UsuarioRequest.getCadastraFotoRequest());

            Map<String, Object> params = new LinkedHashMap<>();
            params.put("Imagem", base);
            params.put("ImagemPerfil", DTO.Usuario.getFoto());
            params.put("Email", DTO.Usuario.getEmail().toLowerCase());

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
                if (line.matches("error")) {
                } else {
                    JSONObject jsonResponse = new JSONObject(line);
                    boolean success = jsonResponse.getBoolean("success");
                    return success;
                }
            }

        } catch (MalformedURLException | JSONException | UnsupportedEncodingException ex) {
            Logger.getLogger(DAOUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }

    public static boolean Login() {
        Map<String, Object> params = new LinkedHashMap<>();
        params.put("Email", DTO.Usuario.getEmail().toLowerCase());
        params.put("Senha", DTO.Usuario.getSenha());
        return ResponseRequest(UsuarioRequest.getLoginRequest(), params, true);
    }

    public static boolean verificaEmail(String email) {
        Map<String, Object> params = new LinkedHashMap<>();
        params.put("Email", email.toLowerCase());
        return ResponseRequest(UsuarioRequest.getVerificaRequest(), params, false);
    }

    public static boolean seguir(String follow) {
        Map<String, Object> params = new LinkedHashMap<>();
        params.put("UserPrim", DTO.Usuario.getId_User());
        params.put("UserSecu", follow);

        return ResponseRequest(UsuarioRequest.getFollowRequest(), params, false);
    }
    
    public static boolean VerificaSeguir(String follow) {
        Map<String, Object> params = new LinkedHashMap<>();
        params.put("UserPrim", DTO.Usuario.getId_User());
        params.put("UserSecu", follow);

        return ResponseRequest(UsuarioRequest.getVerificaFollowRequest(), params, false);
    }
    
    

    public static boolean verificaEmailOutros(String email) {
        Map<String, Object> params = new LinkedHashMap<>();
        params.put("Email", email.toLowerCase());
        params.put("id_User", DTO.Usuario.getId_User());
        return ResponseRequest(UsuarioRequest.getPegaOutrosRequest(), params, false);
    }

    public static boolean CadastraUsuario() {
        Map<String, Object> params = new LinkedHashMap<>();
        try {
            params.put("Nome", URLEncoder.encode(TrataNome(DTO.Usuario.getNome(), DTO.Usuario.getSobrenome()), "UTF-8"));
            params.put("Idade", DTO.Usuario.getIdade());
            params.put("Email", DTO.Usuario.getEmail().toLowerCase());
            params.put("Senha", DTO.Usuario.getSenha());
            params.put("Estado", URLEncoder.encode(DTO.Usuario.getEstado(), "UTF-8"));
            params.put("Cidade", URLEncoder.encode(DTO.Usuario.getCidade(), "UTF-8"));
            params.put("Endereco", URLEncoder.encode(DTO.Usuario.getEndereco(), "UTF-8"));
            params.put("CEP", DTO.Usuario.getCep());
            params.put("Genero", DTO.Usuario.getGenero());
            params.put("telCel", DTO.Usuario.getCelular());
            params.put("PalavraSecret", DTO.Usuario.getPalavraSec());
            return ResponseRequest(UsuarioRequest.getCadastraUsuarioRequest(), params, false);
        } catch (UnsupportedEncodingException ex) {
            Logger.getLogger(DAOUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;

    }

    public static boolean AtualizaPerfil() {
        try {
            Map<String, Object> params = new LinkedHashMap<>();
            params.put("Nome", URLEncoder.encode(TrataNome(DTO.Usuario.getNome(), DTO.Usuario.getSobrenome()), "UTF-8"));
            params.put("Idade", DTO.Usuario.getIdade());
            params.put("Email", DTO.Usuario.getEmail().toLowerCase());
            params.put("Estado", URLEncoder.encode(DTO.Usuario.getEstado(), "UTF-8"));
            params.put("Cidade", URLEncoder.encode(DTO.Usuario.getCidade(), "UTF-8"));
            params.put("Endereco", URLEncoder.encode(DTO.Usuario.getEndereco(), "UTF-8"));
            params.put("CEP", DTO.Usuario.getCep());
            params.put("telCel", DTO.Usuario.getCelular());
            DTO.Usuario.setNome(TrataNome(DTO.Usuario.getNome(), DTO.Usuario.getSobrenome()));
            return ResponseRequest(UsuarioRequest.getAtualizaPerfilRequest(), params, false);
        } catch (UnsupportedEncodingException ex) {
            Logger.getLogger(DAOUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public static boolean AtualizaPerfilSeg() {
        Map<String, Object> params = new LinkedHashMap<>();
        params.put("Email", DTO.Usuario.getEmail().toLowerCase());
        params.put("PalavraSecret", DTO.Usuario.getPalavraSec());
        params.put("Senha", DTO.Usuario.getSenha());
        return ResponseRequest(UsuarioRequest.getAtualizaPerfilSegRequest(), params, false);

    }

    public static boolean SetPrivado() {
        Map<String, Object> params = new LinkedHashMap<>();
        params.put("Privado", DTO.Usuario.getPrivado());
        params.put("Email", DTO.Usuario.getEmail());
        return ResponseRequest(UsuarioRequest.getSetPrivadoRequest(), params, false);
    }

    public static boolean CadastraPref() {
        Map<String, Object> params = new LinkedHashMap<>();
        params.put("Preferencias", DTO.Usuario.getPreferencias());
        params.put("Email", DTO.Usuario.getEmail());
        return ResponseRequest(UsuarioRequest.getCadastraPrefRequest(), params, false);
    }

    public static boolean Premium(String data) {
        Map<String, Object> params = new LinkedHashMap<>();
        params.put("DataExp", data);
        params.put("Email", DTO.Usuario.getEmail());
        return ResponseRequest(UsuarioRequest.getInsertPremium(), params, false);
    }

    public ArrayList<DTO.FollowUser> Seguidores(String response, Map<String, Object> params) {

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
            BufferedReader rd = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            String line;
            if ((line = rd.readLine()) != null) {
                JSONArray json = new JSONArray(line);
                ArrayList<DTO.FollowUser> array = new ArrayList<>();
                int w = 0;
                while (w < json.length()) {
                    JSONObject object = json.getJSONObject(w);
                    DTO.FollowUser usuario = new DTO.FollowUser();
                    usuario.setId_User(object.getString("id_User"));
                    usuario.setNome(object.getString("Nome"));
                    usuario.setIdade(object.getString("Idade"));
                    usuario.setEmail(object.getString("Email"));
                    usuario.setEstado(object.getString("Estado"));
                    usuario.setCidade(object.getString("Cidade"));
                    usuario.setEndereco(object.getString("Endereco"));
                    usuario.setCep(object.getString("CEP"));
                    usuario.setGenero(object.getString("Genero"));
                    usuario.setCelular(object.getString("telCel"));
                    usuario.setPrivado(object.getInt("Privado"));
                    usuario.setFoto(object.getString("ImagemPerfil"));
                    usuario.setPreferencias(object.getString("Preferencias"));
                    array.add(usuario);
                    w++;
                }
                return array;

            }

        } catch (MalformedURLException | UnsupportedEncodingException | NullPointerException ex) {
            Logger.getLogger(DAOUsuario.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(DAOUsuario.class.getName()).log(Level.SEVERE, null, ex);
        } catch (JSONException e) {
            return null;
        }

        return null;
    }

    private static boolean ResponseRequest(String response, Map<String, Object> params, boolean login) {

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

                if (!login) {
                    JSONObject jsonResponse = new JSONObject(line);
                    boolean success = jsonResponse.getBoolean("success");
                    return success;

                } else {
                    JSONObject jsonResponse = new JSONObject(line);
                    boolean success = jsonResponse.getBoolean("success");
                    if (success) {

                        DTO.Usuario.setId_User(jsonResponse.getInt("id_User") + "");
                        DTO.Usuario.setNome(jsonResponse.getString("Nome"));
                        DTO.Usuario.setIdade(jsonResponse.getInt("Idade") + "");
                        DTO.Usuario.setEmail(jsonResponse.getString("Email"));
                        DTO.Usuario.setSenha(jsonResponse.getString("Senha"));
                        DTO.Usuario.setEstado(jsonResponse.getString("Estado"));
                        DTO.Usuario.setCidade(jsonResponse.getString("Cidade"));
                        DTO.Usuario.setEndereco(jsonResponse.getString("Endereco"));
                        DTO.Usuario.setCep(jsonResponse.getString("CEP"));
                        DTO.Usuario.setGenero(jsonResponse.getString("Genero"));
                        DTO.Usuario.setCelular(jsonResponse.getString("telCel") + "");
                        DTO.Usuario.setPrivado(jsonResponse.getInt("Privado"));
                        DTO.Usuario.setPalavraSec(jsonResponse.getString("PalavraSecret"));
                        DTO.Usuario.setPreferencias(jsonResponse.getString("Preferencias"));
                        DTO.Usuario.setFoto(jsonResponse.getString("imagemPerfil"));
                        return true;
                    }
                }
            }

        } catch (MalformedURLException | UnsupportedEncodingException | JSONException | NullPointerException ex) {
            Logger.getLogger(DAOUsuario.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(DAOUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    private static String TrataNome(String nome, String sobrenome) {

        String NomeCompleto = nome + " " + sobrenome;
        String nomeRetorno = "";
        int posicao = 1;
        while (posicao > 0) {
            NomeCompleto = NomeCompleto.replace("  ", " ");
            posicao = NomeCompleto.indexOf("  ");
        }
        NomeCompleto = NomeCompleto.trim();
        String nomes[] = NomeCompleto.split(" ");
        for (int i = 0; i < nomes.length; i++) {
            nomes[i] = nomes[i].substring(0, 1).toUpperCase() + nomes[i].substring(1, nomes[i].length()).toLowerCase();
            nomeRetorno = nomeRetorno + " " + nomes[i];
        }
        nomeRetorno = nomeRetorno.replace(" De ", " de ");
        nomeRetorno = nomeRetorno.replace(" Do ", " do ");
        nomeRetorno = nomeRetorno.replace(" Dos ", " dos ");
        nomeRetorno = nomeRetorno.replace(" Da ", " da ");
        nomeRetorno = nomeRetorno.replace(" Das ", " das ");
        return nomeRetorno;
    }

}
