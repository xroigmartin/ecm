package xroigmartin.ecm.domain.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import xroigmartin.ecm.domain.model.Domain;

public interface DomainRepository extends JpaRepository<Domain, Long> {

}
