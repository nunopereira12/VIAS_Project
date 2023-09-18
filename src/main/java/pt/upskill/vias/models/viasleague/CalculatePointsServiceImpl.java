package pt.upskill.vias.models.viasleague;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pt.upskill.vias.entities.User;
import pt.upskill.vias.models.routes.Leg;
import pt.upskill.vias.models.routes.Step;
import pt.upskill.vias.repositories.LegRepository;
import pt.upskill.vias.repositories.UserRepository;

import java.util.List;

@Service
public class CalculatePointsServiceImpl implements CalculatePointsService{

    @Autowired
    LegRepository legRepository;

    @Autowired
    UserRepository userRepository;

    @Autowired
    SimulateTripService simulateTripService;


    @Override
    public void calculateStepPoints(Leg leg) {
        List<Step> steps = leg.getSteps();
        int legPoints = 0;

        for (Step step : steps) {
            double points = 0;
            int durationInSecs = step.getDurationValue();
            int distanceInMeters = step.getDistanceValue();

            if (step.getTravel_mode().equals("WALKING")) {
                points = durationInSecs / 60.0 + distanceInMeters * 0.01;
                step.setPoints(points);
                legPoints += (int) points;

            } else if (step.getTravel_mode().equals("TRANSIT")) {
                points = durationInSecs / 30.0 + distanceInMeters * 0.001;
                step.setPoints(points);
                legPoints += (int) points;

            } else {

            }
        }

        leg.setPoints(legPoints);
    }

}
