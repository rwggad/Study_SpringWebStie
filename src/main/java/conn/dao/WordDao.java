package conn.dao;

import conn.Model.WordSet;
import conn.interfaces.IWordDao;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


/**
 * xml파일에 명시하지 않고 스프링 컨테이너로 Bean 생성방법 */
//@Service
//@Component
@Repository
public class WordDao implements IWordDao {
    private String driver = "oracle.jdbc.driver.OracleDriver";
    private String url = "jdbc:oracle:thin:@localhost:1521:xe";
    private String id = "root";
    private String pw = "root";

    private DriverManagerDataSource dataSource;
    private JdbcTemplate template;

    public WordDao(){
        this.dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName(driver);
        dataSource.setUrl(url);
        dataSource.setUsername(id);
        dataSource.setPassword(pw);
        template = new JdbcTemplate();
        template.setDataSource(dataSource);
    }

    public WordSet select(final String wordKey) {
        String sql = "SELECT * FROM wordSet WHERE wordKey = ?";
        List<WordSet> words = null;
        words = template.query(sql,
                new PreparedStatementSetter() {
                    public void setValues(PreparedStatement pstmt) throws SQLException {
                        pstmt.setString(1, wordKey);
                    }
                },
                new RowMapper<WordSet>() {
                    public WordSet mapRow(ResultSet rs, int rowNum) throws SQLException {
                        WordSet selectWord = new WordSet();
                        selectWord.setInsertUser(rs.getString(1));
                        selectWord.setWordKey(rs.getString(2));
                        selectWord.setWordValue(rs.getString(3));
                        return selectWord;
                    }
                });
        if(words.isEmpty()){ // 없으면 null
            return null;
        }else{ // select 하려는 단어가 있을 때 반환
            return words.get(0);
        }
    }

    public List<WordSet> selectAll(){ // 저장된 단어 전부 출력
        String sql = "SELECT * FROM wordSet";
        return template.query(sql, new RowMapper<WordSet>() {
                    public WordSet mapRow(ResultSet rs, int i) throws SQLException {
                        WordSet selectWord = new WordSet();
                        selectWord.setInsertUser(rs.getString(1));
                        selectWord.setWordKey(rs.getString(2));
                        selectWord.setWordValue(rs.getString(3));
                        return selectWord;
                    }
                });
    }

    public int insert(final WordSet wordSet) {
        if(select(wordSet.getWordKey()) == null){
            String sql = "INSERT INTO wordSet VALUES(?, ?, ?)";
            return template.update(sql, new PreparedStatementSetter() {
                public void setValues(PreparedStatement preparedStatement) throws SQLException {
                    preparedStatement.setString(1, wordSet.getInsertUser());
                    preparedStatement.setString(2, wordSet.getWordKey());
                    preparedStatement.setString(3, wordSet.getWordValue());
                }
            });
        }else{
            return -1;
        }
    }

    public int update(final WordSet wordSet) {
        String sql = "UPDATE wordSet SET insertUser = ?, wordKey = ?, wordValue =? WHERE wordKey = ?";
        return template.update(sql, new PreparedStatementSetter() {
            public void setValues(PreparedStatement preparedStatement) throws SQLException {
                preparedStatement.setString(1, wordSet.getInsertUser());
                preparedStatement.setString(2, wordSet.getWordKey());
                preparedStatement.setString(3, wordSet.getWordValue());
            }
        });
    }

    public int delete(final WordSet wordSet) {
        String sql = "DELETE FROM wordSet WHERE wordKey = ?";
        return template.update(sql, new PreparedStatementSetter() {
            public void setValues(PreparedStatement preparedStatement) throws SQLException {
                preparedStatement.setString(1,wordSet.getWordKey());
            }
        });
    }
}