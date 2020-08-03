import { Component, OnInit, Input, Output, EventEmitter} from '@angular/core';
import { faUserPlus, faIdCard, faTag,faFile,faLevelUpAlt,faSave, faTimes, faUser, faCalendar, faMapMarkedAlt, faGenderless } from '@fortawesome/free-solid-svg-icons';
import { Club } from 'src/app/models/club';
import { ClubService } from 'src/app/services/club.service';
import { FormBuilder, FormGroup, Validators} from '@angular/forms'
import { ActivatedRoute } from '@angular/router';
@Component({
  selector: 'app-club-form',
  templateUrl: './club-form.component.html',
  styleUrls: ['./club-form.component.css']
})
export class ClubFormComponent implements OnInit {
  faTag=faTag;
  faFile=faFile;
  faLevelUpAlt=faLevelUpAlt;
  faUserPlus =faUserPlus;
  faIdCard = faIdCard;
  faSave = faSave;
  faTimes = faTimes;
  faUser = faUser;
  faCalendar = faCalendar;
  faMapMarkedAlt = faMapMarkedAlt;
  faGenderless = faGenderless;
  @Input() club :Club;
  @Input() title : string;
  @Output() flagToReload = new EventEmitter<Boolean>();

  form: FormGroup;
  submitted: boolean = false;

  constructor(private clubService:ClubService, private formBuilder:FormBuilder,  private activatedRoute : ActivatedRoute ) { }

  ngOnInit(): void {
    this.club=new Club();
    this.form = this.formBuilder.group({
      nombre: ['', [Validators.required]],
      administrador: ['', [Validators.required]],
      categoria: [''],
      edadMin: [''],
      edadMax: [''],
      tipo: [''],
      cupos: [''],

    });
    this.activatedRoute.params.subscribe(
      params => {
        if(params['id']){
          this.clubService.retrieve(params['id']).subscribe(
            result => {
              this.club = result;
              this.title = "Actualizando registro de " + this.club.nombre;
            }
          )
        }
      }
    );
  }
  get f(){
    return this.form.controls;
  }

  onSubmit() : void {

    this.submitted = true;

    if(this.form.invalid){
      console.error('Error en formulario');
      return;
    }

    this.clubService.save(this.club).subscribe(
      result => {
        this.submitted = false;

        console.log(result);
        this.flagToReload.emit(true);
      }
    );
  }

  onReset() : void {
    this.submitted = false;
    this.form.reset();
    this.club = new Club();
  }
}
