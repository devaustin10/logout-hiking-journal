package learn.hiking.data.mappers;

import java.sql.ResultSet;
import java.sql.SQLException;
import learn.hiking.models.Hiker;
import org.springframework.jdbc.core.RowMapper;

public class HikerMapper implements RowMapper<Hiker> {
    public HikerMapper() {
    }

    public Hiker mapRow(ResultSet resultSet, int i) throws SQLException {
        Hiker hiker = new Hiker();
        hiker.setFirstName(resultSet.getString("first_name"));
        hiker.setLastName(resultSet.getString("last_name"));
        hiker.setAge(resultSet.getInt("age"));
        hiker.setHikerId(resultSet.getString("hiker_id"));

        return hiker;
    }
}