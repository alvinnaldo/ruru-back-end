package com.example.ruru_back_end.model.entity;

import com.example.ruru_back_end.enums.WorkspaceInvitationStatus;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.time.OffsetDateTime;
import java.util.UUID;

@Entity
@Table(name = "workspace_invitations")
@Getter
@Setter
@NoArgsConstructor
public class WorkspaceInvitation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer invitationId;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "workspace_id", nullable = false)
    private Workspace workspace;

    @Column(nullable = false)
    private String emailTo;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "granted_role_id", nullable = false)
    private Role role;

    @Column(nullable = false, unique = true, updatable = false)
    private UUID inviteToken;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private WorkspaceInvitationStatus status = WorkspaceInvitationStatus.PENDING;

    @Column(nullable = false , columnDefinition = "TIMESTAMP WITH TIME ZONE")
    @CreationTimestamp
    private OffsetDateTime createdAt;

    @Column(nullable = false, columnDefinition = "TIMESTAMP WITH TIME ZONE")
    @UpdateTimestamp
    private OffsetDateTime updatedAt;

    @Column(nullable = false, columnDefinition = "TIMESTAMP WITH TIME ZONE")
    private OffsetDateTime expiresAt;

    @PrePersist
    protected void onCreate() {
        this.expiresAt = OffsetDateTime.now().plusDays(7);
        if (this.inviteToken == null) {
            this.inviteToken = UUID.randomUUID();
        }
    }
}
