package pt.upskill.vias.services.profile;

import pt.upskill.vias.entities.user.User;
import pt.upskill.vias.models.routes.Leg;

import java.util.List;



public interface HistoryService {

    List<Leg> getUserHistory(User user);

}
