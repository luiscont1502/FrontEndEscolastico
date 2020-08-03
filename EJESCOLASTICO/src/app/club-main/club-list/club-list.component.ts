import { Component, OnInit, Input, Output, EventEmitter, SimpleChanges } from '@angular/core';
import { faListAlt, faEye, faPencilAlt, faTrash,faPlusCircle } from '@fortawesome/free-solid-svg-icons';
import swal from 'sweetalert2';
import { Club } from 'src/app/models/club';
import { ClubService } from 'src/app/services/club.service';
@Component({
  selector: 'app-club-list',
  templateUrl: './club-list.component.html',
  styleUrls: ['./club-list.component.css']
})
export class ClubListComponent implements OnInit {
  faPlusCircle=faPlusCircle;
  faListAlt = faListAlt;
  faEye = faEye;
  faPencilAlt = faPencilAlt;
  faTrash = faTrash;

  clubs : Club[];
  @Output() alumnoToEdit = new EventEmitter<Club>();
  @Input() flagToReload;
  @Output() reloadComplete = new EventEmitter<Boolean>();
  constructor(private clubService:ClubService) { }

  ngOnInit(): void {
    this.list();
  }
  ngOnChanges(changes: SimpleChanges) {
    if(changes.flagToReload.currentValue){
      if(this.flagToReload){
        this.list();
      }
    }
  }


  update(a:Club) :void {
    console.log(a);
    this.alumnoToEdit.emit(a);
  }

  delete(a:Club) :void {
    swal.fire({
      title: '¿Está seguro de continuar?',
      text: "El registro de " + a.nombre + " de " + a.administrador + " será eliminado.",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Confirmar',
      cancelButtonText: 'Cancelar'
    }).then((result) => {
      if (result.value) {
        this.clubService.delete(a).subscribe(
          result => console.log(result)
        )
      }
    })
  }



  list() : void {
    this.clubService.list().subscribe(result => {
      this.clubs = result;
      this.reloadComplete.emit(true);
    });
  }

}
