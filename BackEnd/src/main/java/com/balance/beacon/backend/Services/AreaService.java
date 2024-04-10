package com.balance.beacon.backend.Services;

import com.balance.beacon.backend.Models.Areas;
import com.balance.beacon.backend.Models.GeneralResponse;
import com.balance.beacon.backend.Repositories.AreaRepository;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.List;

@Service
public class AreaService {

    private AreaRepository areaRepository;
    Areas databaseArea = new Areas();
    GeneralResponse generalResponse = new GeneralResponse();

    public AreaService(AreaRepository areaRepository) {
        this.areaRepository = areaRepository;
    }

    public GeneralResponse createArea(Areas area) {
        System.out.println("----- createArea function is calling -----");

        // checking whether the area is already added by the description (area name)
        try {
            databaseArea = areaRepository.findByAreaDescription(area.getAreaDescription());

            if (databaseArea != null) {
                System.out.println("Area already exists in the database");
                generalResponse.setResponseCode(400);
                generalResponse.setResponseDescription("Area already exists");
            }
            else {
                System.out.println("Area not found in the database");
                System.out.println("Therefore adding the new area");

                // get current timestamp
                area.setAreaCreatedDate(new Timestamp(System.currentTimeMillis()));

                databaseArea = areaRepository.save(area);
                generalResponse.setResponseCode(200);
                generalResponse.setResponseDescription("Area created successfully");
                System.out.println("Area created successfully");
            }
        } catch (Exception ex) {
            System.out.println("Area creating failed");
            generalResponse.setResponseCode(400);
            generalResponse.setResponseDescription("Area creating failed");
        }
        return generalResponse;
    }

    public GeneralResponse deleteArea(int areaId) {
        System.out.println("----- deleteArea function is calling -----");

        try {
            // checking whether the given area ID is available in the database
            databaseArea = areaRepository.findByAreaId(areaId);

            if (databaseArea != null) {
                System.out.println("Area found in the database");
                System.out.println("Therefore deleting the area from the database");
                areaRepository.delete(databaseArea);
                generalResponse.setResponseCode(200);
                generalResponse.setResponseDescription("Area deleted successfully");
                System.out.println("Area deleted successfully");
            }
            else {
                System.out.println("Area not found in the database");
                generalResponse.setResponseCode(400);
                generalResponse.setResponseDescription("Area not found");
            }
        } catch (Exception ex) {
            System.out.println("Area deletion failed");
            generalResponse.setResponseCode(400);
            generalResponse.setResponseDescription("Area deletion failed");
            System.out.println(ex.getCause());
        }
        return generalResponse;
    }

    public List<Areas> getAllAreas() {
        System.out.println("----- getAllAreas function is calling -----");
        List<Areas> areas = null;

        try {
            areas = areaRepository.findAll();
            System.out.println("Area retrieved successfully");
        } catch (Exception ex) {
            System.out.println("Area retrieving failed");
        }
        return areas;
    }
}
