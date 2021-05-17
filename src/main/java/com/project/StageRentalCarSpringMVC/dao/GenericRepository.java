package com.project.StageRentalCarSpringMVC.dao;

import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.List;

public interface GenericRepository <I extends Serializable, E extends Serializable>{

    @NotNull
    List<I> getAll ();

    I getById(@NotNull E Id);

    void save(@NotNull I entity);

    void update(@NotNull I entity);

    void delete(@NotNull I entity);

    void deleteById(@NotNull E Id);

}
