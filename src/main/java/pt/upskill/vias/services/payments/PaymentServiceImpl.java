package pt.upskill.vias.services.payments;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;
import pt.upskill.vias.entities.cards.Navegante;
import pt.upskill.vias.entities.cards.ViasCard;
import pt.upskill.vias.repositories.NaveganteRepository;
import pt.upskill.vias.repositories.ViasCardRepository;
import pt.upskill.vias.services.cards.NaveganteService;
import pt.upskill.vias.services.cards.ViasCardService;

@Service
public class PaymentServiceImpl implements PaymentService{
    @Autowired
    NaveganteRepository naveganteRepository;

    @Autowired
    ViasCardRepository viasCardRepository;

    @Autowired
    NaveganteService naveganteService;

    @Autowired
    ViasCardService viasCardService;

    @Override
    public boolean isNavegante(String navegante_id) {
        return navegante_id != null;
    }

    @Override
    public ModelAndView selectForPaymentPage(String navegante_id, Long vias_card_id,ModelAndView mav) {

        if(isNavegante(navegante_id)){
            mav.addObject("navegante",naveganteRepository.getNaveganteByCard_number(navegante_id));
        }
        else{
            mav.addObject("vias",viasCardRepository.getViasCardByCard_number(vias_card_id));
        }
        return mav;
    }

    @Override
    public void processPayment(Long vias_card_id, String navegante_id, String value) {
        if(isNavegante(navegante_id)){
            Navegante nav = naveganteRepository.getNaveganteByCard_number(navegante_id);
            naveganteService.chargeCard(nav);
        }
        else{
            ViasCard vc = viasCardRepository.getViasCardByCard_number(vias_card_id);
            double vc_value = Double.parseDouble(value);
            viasCardService.chargeCard(vc, vc_value);
        }
    }
}
