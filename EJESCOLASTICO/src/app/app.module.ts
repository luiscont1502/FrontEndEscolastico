import { BrowserModule } from '@angular/platform-browser';
import { NgModule, LOCALE_ID } from '@angular/core';

import { registerLocaleData } from '@angular/common';
import localeEs from '@angular/common/locales/es';
registerLocaleData(localeEs);

import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { FontAwesomeModule } from '@fortawesome/angular-fontawesome';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { ServiceInterceptor } from './services/service.interceptor';
import { AlumnoMainComponent } from './alumno-main/alumno-main.component';
import { AlumnoListComponent } from './alumno-main/alumno-list/alumno-list.component';
import { AlumnoFormComponent } from './alumno-main/alumno-form/alumno-form.component';
import { AlumnoCardComponent } from './alumno-main/alumno-card/alumno-card.component';
import { ReactiveFormsModule } from '@angular/forms';
import { AlumnoService } from './services/alumno.service';
import { MasmasPipe } from './shared/pipes/masmas.pipe';
import { SexdescPipe } from './shared/pipes/sexdesc.pipe';
import { MateriaFormComponent } from './materia-form/materia-form.component';
import { ClubMainComponent } from './club-main/club-main.component';
import { ClubListComponent } from './club-main/club-list/club-list.component';
import { ClubFormComponent } from './club-main/club-form/club-form.component';
import { ClubViewComponent } from './club-main/club-view/club-view.component';

@NgModule({
  declarations: [
    AppComponent,
    AlumnoMainComponent,
    AlumnoListComponent,
    AlumnoFormComponent,
    AlumnoCardComponent,
    MasmasPipe,
    SexdescPipe,
    MateriaFormComponent,
    ClubMainComponent,
    ClubListComponent,
    ClubFormComponent,
    ClubViewComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    FontAwesomeModule,
    ReactiveFormsModule
  ],
  providers: [
    AlumnoService, {
    provide: HTTP_INTERCEPTORS,
    useClass: ServiceInterceptor,
    multi: true
  },
  {
    provide: LOCALE_ID,
    useValue : 'es-EC'
  }  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
