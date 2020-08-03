import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { AlumnoService } from 'src/app/services/alumno.service';
import {MatriculaService } from 'src/app/services/matricula.service';
import { Alumno } from 'src/app/models/alumno';
import { Matricula} from 'src/app/models/matricula';
import { faUser, faIdCard, faCalendar, faMapMarked, faGenderless } from '@fortawesome/free-solid-svg-icons';
@Component({
  selector: 'app-alumno-card',
  templateUrl: './alumno-card.component.html',
  styleUrls: ['./alumno-card.component.css']
})
export class AlumnoCardComponent implements OnInit {

  faUser = faUser;
  faIdCard = faIdCard;
  faCalendar = faCalendar;
  faMapMarked = faMapMarked;
  faGenderless = faGenderless;
  alumno:Alumno;
  matriculas : Matricula[];
  constructor(private alumnoservice:AlumnoService,
    private matriculaService: MatriculaService,
    private activatedRoute:ActivatedRoute) { }

  ngOnInit(): void {
    this.activatedRoute.params.subscribe(
      params=>{
        if(params['id']){
          this.alumnoservice.retrieve(params['id']).subscribe(
            result=>this.alumno=result
          )
        }
      }
    );
  }

  listMatriculas() : void {
    this.matriculaService.list(this.alumno.idalumno).subscribe(
      result => this.matriculas = result
    );
  }
}
