package learn.hiking.data;

import learn.hiking.models.Hike;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface HikeRepository {


    List<Hike> findAll();
    Hike findById(int hikeId);

    Hike add(Hike hike);

    boolean update(Hike hike);

    @Transactional
    boolean deleteById(int hikeId);

}
