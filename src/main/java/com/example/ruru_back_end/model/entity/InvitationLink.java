package com.example.ruru_back_end.model.entity;

import com.example.ruru_back_end.enums.InvitationLinkStatus;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;

import java.time.OffsetDateTime;
import java.util.UUID;

@Entity
@Table(name = "invitation_links")
@Getter
@Setter
@NoArgsConstructor
public class InvitationLink {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer invitationLinkId;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "workspace_id", nullable = false)
    private Workspace workspace;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "granted_role_id", nullable = false, columnDefinition = "role_id")
    private Role role;

    @Column(nullable = false, unique = true, updatable = false)
    private UUID linkToken;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private InvitationLinkStatus linkStatus = InvitationLinkStatus.VALID;

    @Column(nullable = false , columnDefinition = "TIMESTAMP WITH TIME ZONE")
    @CreationTimestamp
    private OffsetDateTime createdAt;

    @Column(nullable = false, columnDefinition = "TIMESTAMP WITH TIME ZONE")
    private OffsetDateTime expiresAt;

    @PrePersist
    protected void onCreate() {
        this.expiresAt = OffsetDateTime.now().plusDays(7);
        if (this.linkToken == null) {
            this.linkToken = UUID.randomUUID();
        }
    }
}
