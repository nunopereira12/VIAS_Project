package pt.upskill.vias.services;

import org.springframework.data.jpa.repository.Query;
import pt.upskill.vias.entities.User;
import pt.upskill.vias.models.routes.Leg;

import java.util.List;



public interface HistoryService {

    List<Leg> getAllByTrip_completedAndUserOrderById(boolean simulated, User user);



}
