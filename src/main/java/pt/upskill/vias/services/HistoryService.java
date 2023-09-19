package pt.upskill.vias.services;

import pt.upskill.vias.entities.User;
import pt.upskill.vias.models.routes.Leg;

import java.util.List;



public interface HistoryService {
    List<Leg> getAllByTrip_completedAndUser(boolean simulated, User user);


}
