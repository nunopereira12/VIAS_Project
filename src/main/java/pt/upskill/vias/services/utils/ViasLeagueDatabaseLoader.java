package pt.upskill.vias.services.utils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;
import pt.upskill.vias.entities.League;
import pt.upskill.vias.repositories.LeagueRepository;


@Component
public class ViasLeagueDatabaseLoader implements CommandLineRunner {


    private final LeagueRepository leagueRepository;


    @Autowired
    public ViasLeagueDatabaseLoader(LeagueRepository leagueRepository) {
        this.leagueRepository = leagueRepository;
    }


    @Override
    public void run(String... args) throws Exception {

        if (leagueRepository.getLeagueById(1) == null) {
            League league = new League();
            league.setId(1);
            league.setName("Bronze");
            leagueRepository.save(league);
        }
        if (leagueRepository.getLeagueById(2) == null) {
            League league = new League();
            league.setId(2);
            league.setName("Silver");
            leagueRepository.save(league);

        }
        if (leagueRepository.getLeagueById(3) == null) {
            League league = new League();
            league.setId(3);
            league.setName("Gold");
            leagueRepository.save(league);
        }
        if (leagueRepository.getLeagueById(4) == null) {
            League league = new League();
            league.setId(4);
            league.setName("Platinum");
            leagueRepository.save(league);
        }
        if (leagueRepository.getLeagueById(5) == null) {
            League league = new League();
            league.setId(5);
            league.setName("Diamond");
            leagueRepository.save(league);
        }
    }
}
