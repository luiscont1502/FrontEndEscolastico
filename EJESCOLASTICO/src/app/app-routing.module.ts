import { NgModule, Component } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AlumnoMainComponent } from './alumno-main/alumno-main.component';
import { AlumnoCardComponent } from './alumno-main/alumno-card/alumno-card.component';
import { MateriaFormComponent } from './materia-form/materia-form.component';
import { ClubListComponent } from './club-main/club-list/club-list.component';
import { ClubFormComponent } from './club-main/club-form/club-form.component';
import { ClubViewComponent } from './club-main/club-view/club-view.component';

const routes: Routes = [
  {path: '',redirectTo:'/',pathMatch:'full'},
{path:'alumno',component:AlumnoMainComponent},
{path:'alumno/:id',component:AlumnoCardComponent},
{path:'materias',component:MateriaFormComponent},
{path:'materias/:id',component:MateriaFormComponent},
{path:'club',component:ClubListComponent},
{path:'club/crear',component:ClubFormComponent},
{path:'club/crear/:id',component:ClubFormComponent},
{path:'club/ver/:id',component:ClubViewComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
