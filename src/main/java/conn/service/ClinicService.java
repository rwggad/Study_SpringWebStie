package conn.service;

import conn.Model.ClinicModel.Base.PetType;
import conn.Model.ClinicModel.Owner;
import conn.Model.ClinicModel.Pet;
import conn.dao.ClinicDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ClinicService {

    @Autowired
    ClinicDao dao;

    /**
     * 특정 Owner 정보 가져오기 (By Last Name)
     * */
    public List<Owner> getOwnersByName(String LastName){
        return this.dao.select_ownersByName(LastName);
    }
    /**
     * 특정 Owner 정보 가져오기 (By id)
     */
    public Owner getOwnerById(int id) {
        return this.dao.select_ownerById(id);
    }
    /**
     * Owner 정보 입력하기
     */
    public int putOwner(Owner owner) {
        return this.dao.insert_owner(owner);
    }

    /**
     * Owner 정보 수정하기
     */
    public int modifyOwner(Owner owner) {
        return this.dao.modify_owner(owner);
    }

    /**
     * Pet Type 모든 가져오기
     */
    public List<PetType> getPetTypes() {
        return this.dao.select_petTypes();
    }

    /**
     * Pet Type 특정 정보 가져오기*/
    public PetType getPetType(int id){
        return this.dao.select_petType(id);
    }
    /**
     * Pet 정보 입력
     */
    public int putPet(Pet pet) {
        return this.dao.insert_pet(pet);
    }
}
