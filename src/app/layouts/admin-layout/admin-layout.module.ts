import {NgModule} from '@angular/core';
import {RouterModule} from '@angular/router';
import {CommonModule} from '@angular/common';
import {FormsModule, ReactiveFormsModule} from '@angular/forms';
import {HttpClientModule} from '@angular/common/http';

import {AdminLayoutRoutes} from './admin-layout.routing';

import {DashboardComponent} from '../../dashboard/dashboard.component';
import {UserProfileComponent} from '../../user-profile/user-profile.component';
import {TableListComponent} from '../../table-list/table-list.component';
import {TypographyComponent} from '../../typography/typography.component';
import {IconsComponent} from '../../icons/icons.component';
import {MapsComponent} from '../../maps/maps.component';
import {NotificationsComponent} from '../../notifications/notifications.component';
import {UpgradeComponent} from '../../upgrade/upgrade.component';
import {PlanManagementComponent} from '../plan-management/plan-management.component';
import {TourManagementComponent} from '../tour-management/tour-management.component';
import {PlanningDialogComponent} from '../plan-management/dialog/planning-modal.component';
import {CKEditorModule} from 'ngx-ckeditor';

import {
  MatAutocompleteModule,
  MatButtonModule,
  MatCardModule,
  MatChipsModule,
  MatDatepickerModule,
  MatDialogModule,
  MatIconModule,
  MatInputModule,
  MatListModule,
  MatNativeDateModule,
  MatPaginatorModule,
  MatRippleModule,
  MatSnackBarModule,
  MatTableModule,
  MatTooltipModule
} from '@angular/material';
import {TourListComponent} from '../tour-management/tour-list/tour-list.component';
import {TourFormComponent} from '../tour-management/tour-form/tour-form.component';

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
    MatChipsModule,
    MatSnackBarModule,
    MatCardModule,
    CKEditorModule
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
    PlanManagementComponent,
    PlanningDialogComponent,
    TourManagementComponent,
    TourListComponent,
    TourFormComponent
  ],
  entryComponents: [
    PlanningDialogComponent // custom dialog
  ],

})

export class AdminLayoutModule { }
