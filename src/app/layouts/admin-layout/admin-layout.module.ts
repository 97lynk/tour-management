import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';

import { AdminLayoutRoutes } from './admin-layout.routing';

import { DashboardComponent } from '../../dashboard/dashboard.component';
import { UserProfileComponent } from '../../user-profile/user-profile.component';
import { TableListComponent } from '../../table-list/table-list.component';
import { TypographyComponent } from '../../typography/typography.component';
import { IconsComponent } from '../../icons/icons.component';
import { MapsComponent } from '../../maps/maps.component';
import { NotificationsComponent } from '../../notifications/notifications.component';
import { UpgradeComponent } from '../../upgrade/upgrade.component';
import { PlanManagementComponent } from '../plan-management/plan-management.component';
import { PlanningDialogComponent } from '../plan-management/dialog/planning-modal.component';


import {
  MatButtonModule,
  MatIconModule,
  MatInputModule,
  MatRippleModule,
  MatTooltipModule,
  MatTableModule,
  MatPaginatorModule,
  MatListModule,
  MatDialogModule,
  MatDatepickerModule,
  MatNativeDateModule,
  MatAutocompleteModule,
  MatChipsModule
} from '@angular/material';

@NgModule({
  imports: [
    CommonModule,
    RouterModule.forChild(AdminLayoutRoutes),
    FormsModule, ReactiveFormsModule,
    HttpClientModule,
    MatButtonModule,
    MatIconModule,
    MatRippleModule,
    MatInputModule,
    MatTooltipModule,
    MatTableModule,
    MatPaginatorModule,
    MatListModule,
    MatDialogModule,
    MatDatepickerModule,
    MatNativeDateModule,
    MatAutocompleteModule,
    MatChipsModule
  ],
  declarations: [
    DashboardComponent,
    UserProfileComponent,
    TableListComponent,
    TypographyComponent,
    IconsComponent,
    MapsComponent,
    NotificationsComponent,
    UpgradeComponent,
    PlanManagementComponent,
    PlanningDialogComponent,
    
  ],
  entryComponents: [
    PlanningDialogComponent // custom dialog
  ],

})

export class AdminLayoutModule { }
