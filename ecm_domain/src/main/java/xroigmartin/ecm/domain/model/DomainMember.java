package xroigmartin.ecm.domain.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.UniqueConstraint;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDateTime;

@Entity
@Table(name = "domain_member", uniqueConstraints = {
        @UniqueConstraint(name = "domain_member_uk", columnNames = {"id_domain", "member_code"})
})
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@EqualsAndHashCode
public class DomainMember implements Serializable {

    @Serial
    private static final long serialVersionUID = 5696742778909118945L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "member_code", nullable = false, length = 25)
    private String code;

    @Column(name="member_definition")
    private String definition;

    @Column(name = "active", nullable = false)
    private Boolean active = Boolean.TRUE;

    @Column(name = "create_on", nullable = false, updatable = false)
    private LocalDateTime createOn = LocalDateTime.now();

    @Column(name = "modify_on", nullable = false)
    private LocalDateTime modify_on = LocalDateTime.now();

    @JoinColumn(name = "id_domain", nullable = false, updatable = false)
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Domain domain;

}
